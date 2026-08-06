{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "toggle speaker mute state with avizo notification";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "volumectl";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-u";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "direction";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "up-or-down.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "up-or-down.cs" = builtins.readFile ./up-or-down.cs;
      };
    }
  ];
}
