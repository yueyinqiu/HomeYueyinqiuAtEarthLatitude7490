{ nur, ... }:
{
  home.packages = [
    nur.yueyinqiu.nix-daemon-proxy-client
  ];

  systemd.user.services.nix-daemon-proxy-auto = {
    Unit = {
      Description = "Set nix-daemon proxy";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${nur.yueyinqiu.nix-daemon-proxy-client}/bin/NixDaemonProxy.Client socks5 -H 127.0.0.1 -P 26290";
      Restart = "on-failure";
      RestartSec = "5s";
      StartLimitIntervalSec = 300;
      StartLimitBurst = 60;
    };
  };
}
