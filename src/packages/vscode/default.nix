{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "c";
      text = ''
        exec niri msg action spawn -- code "$PWD"
      '';
    })
  ];
}
