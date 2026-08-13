{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run bash, an sh-compatible shell that incorporates useful features from the Korn shell (ksh) and the C shell (csh)";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "bash";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
