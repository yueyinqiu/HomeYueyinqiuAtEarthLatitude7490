{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "adjust speaker volume with avizo notification";
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
        ExtraArguments = true;
      };
      extraFiles = {
        "up-or-down.cs" = builtins.readFile ./up-or-down.cs;
      };
    }
  ];
}
