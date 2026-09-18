{ mindustry-bin, ... }: {
  home.packages = [
    mindustry-bin.mindustry-bin-160_3
  ];
  imports = [
    ./cheats.nix
  ];
}
