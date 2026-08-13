{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "open mihomo-tui dashboard, connecting to the selected proxy instance";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "my-proxies-mihomo-tui";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "proxy";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-proxies.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-proxies.cs" = builtins.readFile ./list-proxies.cs;
      };
    }
  ];
}
