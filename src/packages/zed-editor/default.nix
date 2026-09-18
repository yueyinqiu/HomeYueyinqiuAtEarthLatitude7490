{
  pkgs,
  ...
}:
{
  imports = [
    ./settings
    ./cheats.nix
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
