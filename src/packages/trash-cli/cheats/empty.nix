{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "empty all files from trash";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "trash-empty";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
