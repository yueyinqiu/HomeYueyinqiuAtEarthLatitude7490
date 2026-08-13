{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run fuzzel, a Wayland-native application launcher and fuzzy finder, inspired by rofi and dmenu";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "fuzzel";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
