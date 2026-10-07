{ ... }: {
  imports = [
    ./binds.nix
    ./window-rules.nix
  ];
  
  wayland.windowManager.niri.settings = {
    "screenshot-path" = null;
    "spawn-sh-at-startup" = "$HOME/.config/niri/spawn-at-startup.sh";
  };
}
