{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run command with proxy environment variables set for the selected proxy instance";
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
