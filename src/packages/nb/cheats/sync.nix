{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "sync the current nb notebook";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nb";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "sync";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
