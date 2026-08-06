{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "disable nb auto sync";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nb";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "set";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "auto_sync";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "0";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
