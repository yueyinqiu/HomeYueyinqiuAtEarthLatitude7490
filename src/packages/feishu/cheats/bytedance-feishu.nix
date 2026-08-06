{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run feishu, a new way to collaborate, empowering teams by messenger, meetings, calendar, docs, and emails";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "bytedance-feishu";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
