{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    python314Packages.huggingface-hub
    (writeShellApplication {
      name = "my-hf-with-proxy";
      text = ''
        export HTTP_PROXY="socks5h://127.0.0.1:52095"
        export HTTPS_PROXY="socks5h://127.0.0.1:52095"
        export http_proxy="socks5h://127.0.0.1:52095"
        export https_proxy="socks5h://127.0.0.1:52095"
        hf "$@"
      '';
    })
  ];

  my.proxies.for-huggingface = {
    files = [
      ./config.sh.example
      ./rules.yaml
    ];
    port = 52095;
  };
}
