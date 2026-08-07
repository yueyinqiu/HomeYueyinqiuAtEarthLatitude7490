{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run steam-run, to run commands in the same FHS environment that is used for Steam";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "steam-run";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
