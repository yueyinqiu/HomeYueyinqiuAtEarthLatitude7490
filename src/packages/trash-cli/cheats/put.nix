{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "move file or directory to trash";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "trash-put";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "file";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-targets.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-targets.cs" = builtins.readFile ./list-targets.cs;
      };
    }
  ];
}
