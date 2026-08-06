{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "list files in trash";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "trash-list";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
