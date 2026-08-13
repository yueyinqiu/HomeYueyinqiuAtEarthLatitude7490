{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run nixd, a feature-rich nix language server interoperating with C++ nix";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nixd";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
