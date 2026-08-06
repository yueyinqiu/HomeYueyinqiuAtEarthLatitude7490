{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "print fcitx5 diagnostic info for troubleshooting";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "fcitx5-diagnose";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
