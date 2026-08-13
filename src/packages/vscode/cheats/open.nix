{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "open a file or folder with vscode";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "code";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "target";
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
