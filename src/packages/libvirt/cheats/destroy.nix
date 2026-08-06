{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "force power off a virtual machine";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "virsh";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "destroy";
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
