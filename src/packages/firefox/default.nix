{pkgs, ...}: {
  programs.firefox.enable = true;
  
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
