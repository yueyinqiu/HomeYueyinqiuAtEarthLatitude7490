{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run htop, a cross-platform interactive process viewer";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "htop";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
