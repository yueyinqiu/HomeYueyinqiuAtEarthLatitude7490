{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run remmina, an X2Go, RDP, SSH, SPICE, VNC, and X2Go protocol remote desktop client";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "remmina";
          }
        ];
        ExtraArguments = false;
      };
    }
  ];
}
