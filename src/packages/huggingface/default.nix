{
  pkgs,
  ...
}:
{
  imports = [
    ./cheats.nix
  ];

  home.packages = with pkgs; [
    python314Packages.huggingface-hub
    (writeShellApplication {
      name = "my-hf-with-proxy";
      text = ''
        export HTTP_PROXY="http://127.0.0.1:51879"
        export HTTPS_PROXY="http://127.0.0.1:51879"
        export http_proxy="http://127.0.0.1:51879"
        export https_proxy="http://127.0.0.1:51879"
        hf "$@"
      '';
    })
  ];

  my.proxies.for-huggingface = {
    files = [
      ./proxy/config.sh.example
      ./proxy/rules.yaml
    ];
    port = 52095;
  };

  programs.home-manager-mihomo-manager.instances.for-huggingface = {
    port = 51879;
    configuration = ./config;
  };
}
