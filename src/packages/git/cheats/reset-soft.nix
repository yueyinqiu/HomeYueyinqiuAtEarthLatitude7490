{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "soft undo last commit, keeping all changes staged";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "git";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "reset";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "--soft";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "HEAD~1";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
