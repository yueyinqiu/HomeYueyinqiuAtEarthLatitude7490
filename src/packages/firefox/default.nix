{ ... }: {
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

  home.shellAliases.f = "niri msg action spawn -- firefox";

  imports = [
    ./cheats
  ];
}
