{ nixpkgs-mindustry, ... }: {
  # https://github.com/NixOS/nixpkgs/issues/544566
  home.packages = [
    nixpkgs-mindustry.mindustry-wayland
  ];
  imports = [
    ./cheats
  ];
}
