{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "decompress any archive with ouch";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "ouch";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "decompress";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "file";
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
