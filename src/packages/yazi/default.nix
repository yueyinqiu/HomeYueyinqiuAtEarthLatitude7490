{ ... }: {
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  imports = [
    ./cheats
  ];

  my.navi-cheats.yazi = ''
    # run yazi, a terminal file manager written in Rust, based on non-blocking async I/O.
    y
  '';
}
