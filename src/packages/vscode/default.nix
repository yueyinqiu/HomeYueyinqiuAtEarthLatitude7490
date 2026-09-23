{ pkgs, ... }: {
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscode.fhsWithPackages (ps: [
    ps.nixd
    ps.nixfmt
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
