{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "try a nix package";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nix";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "shell";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "package";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "suggest-packages.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "suggest-packages.cs" = builtins.readFile ./suggest-packages.cs;
      };
    }
  ];
}
