{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "resume a specific opencode session";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "opencode";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-s";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "session";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-sessions.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-sessions.cs" = builtins.readFile ./list-sessions.cs;
      };
    }
  ];
}
