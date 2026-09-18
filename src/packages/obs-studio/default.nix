{ ... }: {
  programs.obs-studio.enable = true;

  imports = [
    ./cheats.nix
  ];
}
