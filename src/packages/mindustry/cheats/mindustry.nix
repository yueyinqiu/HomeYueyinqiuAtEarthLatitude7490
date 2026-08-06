{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run mindustry, a sandbox tower-defense game";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "mindustry";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
