{ ... }: {
  services.mako.enable = true;
  imports = [
    ./cheats
  ];

  my.navi-cheats.mako = ''
    # view recent mako notification history
    makoctl history -j
  '';
}
