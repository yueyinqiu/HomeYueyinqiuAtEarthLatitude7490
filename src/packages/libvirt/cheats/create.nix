{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "create preallocated raw disk image for a virtual machine";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "qemu-img";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "create";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-f";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "raw";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "-o";
          }
          {
            "$type" = "CommandTokenLiteral";
            Value = "preallocation=full";
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "file";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "suggest-file.cs";
            };
          }
          {
            "$type" = "CommandTokenVariable";
            Name = "size";
            Suggester = {
              "$type" = "ArgumentSuggesterCsharp";
              ScriptPath = "suggest-size.cs";
            };
          }
        ];
        ExtraArguments = false;
      };
      extraFiles = {
        "suggest-file.cs" = builtins.readFile ./suggest-file.cs;
        "suggest-size.cs" = builtins.readFile ./suggest-size.cs;
      };
    }
  ];
}
