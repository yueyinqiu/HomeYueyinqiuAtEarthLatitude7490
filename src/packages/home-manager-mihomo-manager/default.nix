{ ... }: {
  programs.home-manager-mihomo-manager.enable = true;

  imports = [
    ./cheats.nix
  ];
}
