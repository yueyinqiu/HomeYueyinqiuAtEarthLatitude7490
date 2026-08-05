{ nixpkgs-mindustry, ... }: {
  home.packages = [
    # nixpkgs-mindustry.mindustry-wayland
  ];
  my.navi-cheats.mindustry = ''
    # run mindustry, a sandbox tower-defense game.
    mindustry
  '';
}
