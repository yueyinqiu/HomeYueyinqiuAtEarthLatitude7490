{ nur, ... }:
{
  home.packages = [
    nur.yueyinqiu.nix-daemon-proxy-client
  ];

  home-manager-mihomo-manager.instances.for-nix-daemon = {
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
      ExecStart = "/run/current-system/sw/bin/nix-daemon-proxy socks5 -H 127.0.0.1 -P 53849";
      Restart = "on-failure";
      RestartSec = "5s";
      StartLimitIntervalSec = 300;
      StartLimitBurst = 60;
    };
  };
}
