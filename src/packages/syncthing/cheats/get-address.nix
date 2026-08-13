{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "get the address of syncthing web ui";
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
