{ ... }: {
  programs.fuzzel.enable = true;
  imports = [
    ./cheats
  ];

  my.navi-cheats.fuzzel = ''
    # run fuzzel, a Wayland-native application launcher and fuzzy finder, inspired by rofi and dmenu.
    fuzzel
  '';
}
