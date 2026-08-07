{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run snavi, a navi-like interactive command-line cheatsheet tool but it's more safe with structured cheat file and CSharp script support";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "my-global-snavi";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
