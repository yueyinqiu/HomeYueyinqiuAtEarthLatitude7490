{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode.fhs;

  home.shellAliases.v = ''code "$@"'';

  imports = [
    ./cheats
  ];
}
