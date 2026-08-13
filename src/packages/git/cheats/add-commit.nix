{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "stage all files, including untracked ones, and commit";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "my-git-add-commit";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "message";
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
