{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "attach GUI viewer to a running domain";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "virt-viewer";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "--attach";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "domain";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-domains.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-domains.cs" = builtins.readFile ./list-domains.cs;
      };
    }
  ];
}
