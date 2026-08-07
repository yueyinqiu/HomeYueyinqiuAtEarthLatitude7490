{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "restore a specific file from trash";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "trash-restore";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "trash";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-trash.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-trash.cs" = builtins.readFile ./list-trash.cs;
      };
    }
  ];
}
