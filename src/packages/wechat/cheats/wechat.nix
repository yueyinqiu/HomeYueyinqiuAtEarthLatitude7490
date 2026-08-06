{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run wechat, a social communication app serving over 1 billion users, supporting free chat, HD voice and video calls, Moments, and mobile payments, making communication and life more convenient";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "wechat";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
