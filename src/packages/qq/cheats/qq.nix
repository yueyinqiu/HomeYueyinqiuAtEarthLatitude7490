{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run qq, an instant messaging and social platform for PC and mobile users";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "qq";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
