{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "list contents of an archive without extracting";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "ouch";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "list";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "archive";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-archives.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-archives.cs" = builtins.readFile ./list-archives.cs;
      };
    }
  ];
}
