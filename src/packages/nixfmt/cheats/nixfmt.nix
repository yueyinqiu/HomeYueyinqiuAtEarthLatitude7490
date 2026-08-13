{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run nixfmt, the official formatter for Nix language code";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nixfmt";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
