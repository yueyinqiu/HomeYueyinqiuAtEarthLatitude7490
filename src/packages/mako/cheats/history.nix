{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "view recent mako notification history";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "makoctl";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "history";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-j";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
