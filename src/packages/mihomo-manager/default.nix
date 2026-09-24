{ pkgs, ... }: {
  home-manager-mihomo-manager.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "m";
      text = ''
        exec mihomo-manager "$@"
      '';
    })
  ];

  imports = [
    ./cheats.nix
  ];
}
