{ config, ... }:

{
  my.r.sing-box-ailab-start-vpn = ''
    echo "VNC: 127.0.0.1:52495 Password: vnc"
    mkdir -p "$HOME/.atrust-data/ailab"
    docker run -ti \
        --rm \
        --device /dev/net/tun \
        --cap-add NET_ADMIN \
        --sysctl net.ipv4.conf.default.route_localnet=1 \
        -v "$HOME/.atrust-data/ailab:/root" \
        -p 127.0.0.1:52495:5901 \
        -p 127.0.0.1:59553:1080 \
        --dns 114.114.114.114 \
        -e URLWIN=1 \
        -e PASSWORD=vnc \
        hagb/docker-atrust
    # vnc: 127.0.0.1:52495 (vnc)
    # proxy: socks5h://127.0.0.1:59553
  '';

home.file.".atrust-data/ailab2/.keep".text = "";

  services.podman.containers.pjlab-atrust = {
    image = "docker.io/hagb/docker-atrust";
    autoStart = true;

    ports = [
      "127.0.0.1:52495:5901"
      "127.0.0.1:59553:1080"
    ];

    environment = {
      URLWIN = "1";
      PASSWORD = "vnc";
    };

    volumes = [
      "${config.home.homeDirectory}/.atrust-data/ailab2:/root"
    ];

    devices = [ "/dev/net/tun" ];
    addCapabilities = [ "NET_ADMIN" ];

    extraPodmanArgs = [
      "-t"
      "-i"
      "--sysctl=net.ipv4.conf.default.route_localnet=1"
      "--dns=114.114.114.114"
    ];
  };
}
