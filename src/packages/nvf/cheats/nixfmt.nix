{...}: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "neovim, nvim";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "nvim";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
