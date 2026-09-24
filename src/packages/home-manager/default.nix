{ ... }: {
  programs.home-manager.enable = true;

  imports = [
    ./cheats.nix
  ];
}
