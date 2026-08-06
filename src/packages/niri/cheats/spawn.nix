{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "spawn command inside active niri session";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "niri";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "msg";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "action";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "spawn";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "--";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
