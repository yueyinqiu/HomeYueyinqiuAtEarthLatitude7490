{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "gracefully shutdown a virtual machine";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "virsh";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "shutdown";
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
