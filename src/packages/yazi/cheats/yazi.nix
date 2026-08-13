{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run yazi, a terminal file manager written in Rust, based on non-blocking async I/O";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "yazi";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
