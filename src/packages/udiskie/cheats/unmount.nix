{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "unmount a disk partition";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "udisksctl";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "unmount";
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
