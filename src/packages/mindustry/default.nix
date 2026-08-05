{ nixpkgs-mindustry, ... }: {
  # https://github.com/NixOS/nixpkgs/issues/544566
  home.packages = [
    nixpkgs-mindustry.mindustry-wayland
  ];
  my.navi-cheats.mindustry = ''
    # run mindustry, a sandbox tower-defense game.
    mindustry
  '';
}
