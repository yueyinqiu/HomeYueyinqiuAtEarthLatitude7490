{ config, ... }: {
  imports = [
    ./binds.nix
    ./window-rules.nix
  ];

  wayland.windowManager.niri.settings = {
    "screenshot-path" = null;
    "spawn-sh-at-startup" = "${config.xdg.configHome}/niri/spawn-at-startup.sh";
  };

  xdg.configFile."niri/spawn-at-startup.sh" = {
    source = ./spawn-at-startup.sh;
    executable = true;
  };
}
