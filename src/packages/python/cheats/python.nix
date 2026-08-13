{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run python, a versatile and easy-to-learn language that lets you work quickly and integrate systems more effectively";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "python";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
