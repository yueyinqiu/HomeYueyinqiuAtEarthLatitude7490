{ pkgs, ... }:
{
  # my.r.sing-box-ailab-start-vpn = ''
  #   echo "VNC: 127.0.0.1:52495 Password: vnc"
  #   mkdir -p "$HOME/.atrust-data/ailab"
  #   docker run -ti \
  #       --rm \
  #       --device /dev/net/tun \
  #       --cap-add NET_ADMIN \
  #       --sysctl net.ipv4.conf.default.route_localnet=1 \
  #       -v "$HOME/.atrust-data/ailab:/root" \
  #       -p 127.0.0.1:52495:5901 \
  #       -p 127.0.0.1:59553:1080 \
  #       --dns 114.114.114.114 \
  #       -e URLWIN=1 \
  #       -e PASSWORD=vnc \
  #       hagb/docker-atrust
  #   # vnc: 127.0.0.1:52495 (vnc)
  #   # proxy: socks5h://127.0.0.1:59553
  # '';

  home.packages = [
    (pkgs.writeShellApplication {
      name = "my-proxy-to-pjlab-vpn-vnc";
      text = ''
        echo "password: 1"
        "${pkgs.remmina}/bin/remmina" -c vnc://127.0.0.1:52495
      '';
    })
  ];

  xdg.configFile."pjlab-atrust/compose.yml".text = ''
    name: pjlab-atrust
    services:
      pjlab-atrust:
        container_name: pjlab-atrust
        image: docker.io/hagb/docker-atrust
        restart: unless-stopped
        ports:
          - "127.0.0.1:52495:5901"
          - "127.0.0.1:59553:1080"
        environment:
          URLWIN: "1"
          PASSWORD: "1"
        devices:
          - "/dev/net/tun"
        cap_add:
          - "NET_ADMIN"
        sysctls:
          - "net.ipv4.conf.default.route_localnet=1"
        dns:
          - "114.114.114.114"
  '';

  systemd.user.services."pjlab-atrust-podman-start" = {
    Unit = {
      Description = "aTrust VPN container (pjlab) via podman-compose";
      After = [ "network-online.target" ];
      Wants = [ "network-online.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = ''cd ''${XDG_CONFIG_HOME:-$HOME/.config}/pjlab-atrust ${pkgs.podman-compose}/bin/podman-compose up'';
      Restart = "on-failure";
      RestartSec = "5s";
      StartLimitIntervalSec = 300;
      StartLimitBurst = 60;
    };
    Install.WantedBy = [ "default.target" ];
  };
}
