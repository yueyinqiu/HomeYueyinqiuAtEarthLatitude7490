{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "compress files or directory into archive";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "ouch";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "compress";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "target";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-targets.cs";
            };
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "output";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "compress-suggest-outputs.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-targets.cs" = builtins.readFile ./list-targets.cs;
        "compress-suggest-outputs.cs" = builtins.readFile ./compress-suggest-outputs.cs;
      };
    }
  ];
}
