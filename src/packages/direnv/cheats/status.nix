{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "check direnv status and currently loaded environment variables";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "direnv";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "status";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
