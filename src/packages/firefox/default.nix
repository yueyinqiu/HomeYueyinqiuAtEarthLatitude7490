{pkgs, ...}: {
  programs.firefox.enable = true;

  my.proxies.for-firefox = {
    files = [
      ./proxy/config.sh.example
      ./proxy/remove-proxies.yaml
      ./proxy/update-proxy-groups.js
      ./proxy/prepend-rules.yaml
    ];
    port = 10538;
  };

  programs.home-manager-mihomo-manager.instances.for-firefox = {
    port = 37260;
    configuration = ./proxy-config;
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "f";
      text = ''
        exec niri msg action spawn -- firefox
      '';
    })
  ];

  imports = [
    ./cheats.nix
  ];
}
