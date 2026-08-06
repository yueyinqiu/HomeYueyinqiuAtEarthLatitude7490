{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "power off a disk device";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "udisksctl";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "power-off";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-b";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "device";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-devices.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-devices.cs" = builtins.readFile ./list-devices.cs;
      };
    }
  ];
}
