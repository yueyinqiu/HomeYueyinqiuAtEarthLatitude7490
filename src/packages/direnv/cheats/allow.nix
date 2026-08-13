{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "grant permission to run the current .envrc in this directory";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "direnv";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "allow";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
