{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "adjust screen brightness with avizo notification";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "lightctl";
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
