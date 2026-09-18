{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode.fhsWithPackages (pkgs: [ 
    pkgs.nixfmt
    pkgs.nixd
  ]);

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
