{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "list all available installed fonts matching a search keyword";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "my-fontconfig-find-family";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "keyword";
            Suggester = {
              "$type" = "ArgumentSuggesterEmpty";
            };
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
