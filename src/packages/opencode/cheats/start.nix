{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "start a new opencode interactive session";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "opencode";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
