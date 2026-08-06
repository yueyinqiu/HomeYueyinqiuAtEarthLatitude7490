{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "set nb sync url";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nb";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "remote";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "set";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
