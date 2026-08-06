{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run wemeet, namely, Tencent video conferencing";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "flatpak";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "run";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "com.tencent.wemeet";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
