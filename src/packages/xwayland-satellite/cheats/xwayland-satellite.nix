{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run xwayland-satellite, which grants rootless Xwayland integration to any Wayland compositor implementing xdg_wm_base and viewporter";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "xwayland-satellite";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
