{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "spawn firefox via niri, detached from current shell";
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
          {
            "$type" = "CommandTokenLiteral";
            Value = "firefox";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
