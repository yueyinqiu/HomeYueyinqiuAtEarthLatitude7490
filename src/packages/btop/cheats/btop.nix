{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run btop, a resource monitor that shows usage and stats for processor, memory, disks, network and processes";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "btop";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
