{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode.fhs;

  imports = [
    ./cheats.nix
  ];

  home.packages = [
    (pkgs.writeShellApplication {
      name = "c";
      text = ''
        exec code "$@"
      '';
    })
  ];
}
