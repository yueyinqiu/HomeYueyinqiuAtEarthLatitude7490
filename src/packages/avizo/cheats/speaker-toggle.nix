{...}: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "adjust speaker volume with avizo notification";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "volumectl";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "toggle-mute";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
