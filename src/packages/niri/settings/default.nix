{ config, ... }: {
  imports = [
    ./binds.nix
    ./window-rules.nix
  ];

  wayland.windowManager.niri.settings = {
    # Preserve the input section from the original config. This is NOT all
    # niri defaults: it sets touchpad scroll-factor 0.4 (slower/smoother than
    # the default 1.0) and disables power-key handling.
    input = {
      keyboard = {
        xkb = { };
        numlock = { };
      };
      touchpad = {
        tap = { };
        "natural-scroll" = { };
        "scroll-factor" = 0.4;
      };
      mouse = { };
      trackpoint = { };
      "disable-power-key-handling" = { };
    };
    "screenshot-path" = null;
    "spawn-sh-at-startup" = "${config.xdg.configHome}/niri/spawn-at-startup.sh";
  };

  xdg.configFile."niri/spawn-at-startup.sh" = {
    source = ./spawn-at-startup.sh;
    executable = true;
  };
}
