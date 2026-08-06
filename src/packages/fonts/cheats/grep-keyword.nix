{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "list all available installed fonts matching a search keyword";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "fc-list";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = ":";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "family";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "|";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "sort";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-u";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "|";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "grep";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-i";
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
