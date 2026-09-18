{ ... }: {
  programs.fuzzel.enable = true;
  imports = [
    ./cheats.nix
  ];
}
