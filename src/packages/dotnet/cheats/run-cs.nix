{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run a dotnet file-based app";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "dotnet";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "run";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "script";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-cs.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-cs.cs" = builtins.readFile ./list-cs.cs;
      };
    }
  ];
}
