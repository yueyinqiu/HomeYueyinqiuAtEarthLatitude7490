{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "my-proxies-with";
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
        ExtraArguments = true;
      };
      extraFiles = {
        "list-proxies.cs" = builtins.readFile ./list-proxies.cs;
      };
    }
  ];
}
