{ pkgs, ... }: {
  home.packages = with pkgs; [
    htop
  ];
  imports = [
    ./cheats
  ];

  my.navi-cheats.htop = ''
    # run htop, a cross-platform interactive process viewer.
    htop
  '';
}
