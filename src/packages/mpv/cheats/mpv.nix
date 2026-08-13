{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "play a video file with mpv";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "mpv";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "target";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "list-files.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "list-files.cs" = builtins.readFile ./list-files.cs;
      };
    }
  ];
}
