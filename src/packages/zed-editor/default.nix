{
  pkgs,
  ...
}:
{
  imports = [
    ./settings
  ];

  programs.zed-editor.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "z";
      text = ''
        exec zeditor "$@"
      '';
    })
  ];
}
