{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "open syncthing web ui in default browser";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "syncthing";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "cli";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "config";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "gui";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "raw-address";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "get";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
