{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "pick a niri window with the mouse and print information about it";
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
            Value = "pick-window";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
