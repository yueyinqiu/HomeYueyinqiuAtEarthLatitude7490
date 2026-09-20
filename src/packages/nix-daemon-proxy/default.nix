{ nur, ... }:
{
  home.packages = [
    nur.yueyinqiu.nix-daemon-proxy-client
  ];

  my.proxies.for-nix-daemon = {
    files = [
      ./config.sh.example
      ./rules.yaml
    ];
    port = 26290;
  };

  programs.home-manager-mihomo-manager.instances.for-nix-daemon = {
    port = 53849;
    configuration = ./config;
  };

  systemd.user.services.nix-daemon-proxy-auto = {
    Unit = {
      Description = "Set nix-daemon proxy";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${nur.yueyinqiu.nix-daemon-proxy-client}/bin/NixDaemonProxy.Client socks5 -H 127.0.0.1 -P 53849";
      Restart = "on-failure";
      RestartSec = "5s";
      StartLimitIntervalSec = 300;
      StartLimitBurst = 60;
    };
  };
}
