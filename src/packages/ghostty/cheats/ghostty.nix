{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run ghostty, a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "ghostty";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
