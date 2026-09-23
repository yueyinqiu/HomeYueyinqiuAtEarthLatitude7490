{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode.fhs;

  imports = [
    ./settings
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
