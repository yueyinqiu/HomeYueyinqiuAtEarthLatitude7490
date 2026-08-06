{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run wps, a free all-in-one office suite for Microsoft Word, Excel, PowerPoint, and PDF files";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "wps";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
