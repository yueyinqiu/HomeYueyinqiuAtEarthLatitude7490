{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "list all home-manager environment generations";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "home-manager";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "generations";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
