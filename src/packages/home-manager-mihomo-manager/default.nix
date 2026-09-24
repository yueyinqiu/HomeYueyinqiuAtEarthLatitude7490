{ pkgs, ... }: {
  programs.home-manager-mihomo-manager.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "m";
      text = ''
        exec home-manager-mihomo-manager "$@"
      '';
    })
  ];

  imports = [
    ./cheats.nix
  ];
}
