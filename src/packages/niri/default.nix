{
  pkgs,
  niri,
  config,
  ...
}:
{
  imports = [
    ./settings
    ./cheats.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    package = niri.niri;
    enableDefaultConfig = false;
  };

  xdg.portal.config.niri = {
    default = [
      "gnome"
      "gtk"
    ];
    "org.freedesktop.impl.portal.Access" = "gtk";
    "org.freedesktop.impl.portal.FileChooser" = "gtk";
    "org.freedesktop.impl.portal.Notification" = "gtk";
  };

  home.packages = [
    pkgs.xdg-desktop-portal-gtk
    (pkgs.writeShellApplication {
      name = "n";
      text = ''
        exec ${config.wayland.windowManager.niri.package}/bin/niri-session
      '';
    })
  ];
}
