{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run flatpak, a framework for distributing desktop applications across various Linux distributions";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "flatpak";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
