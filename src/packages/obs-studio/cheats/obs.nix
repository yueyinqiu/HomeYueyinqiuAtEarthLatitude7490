{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run obs-studio, a software designed for capturing, compositing, encoding, recording, and streaming video content, efficiently";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "obs";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
