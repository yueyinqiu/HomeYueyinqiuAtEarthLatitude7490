{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run vscode, a free, open-source code editor for Windows, macOS, and Linux";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "code";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
