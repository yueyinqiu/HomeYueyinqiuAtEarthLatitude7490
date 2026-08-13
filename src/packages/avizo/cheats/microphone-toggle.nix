{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "toggle microphone mute state with avizo notification";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "volumectl";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-m";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "toggle-mute";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
