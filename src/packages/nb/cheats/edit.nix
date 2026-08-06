{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "edit a note in the current nb notebook";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nb";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "edit";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "note";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-notes.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-notes.cs" = builtins.readFile ./list-notes.cs;
      };
    }
  ];
}
