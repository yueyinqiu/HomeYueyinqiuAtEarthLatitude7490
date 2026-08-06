{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "execute a command and leave the interactive bash session open";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "my-expect-bash-run";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
