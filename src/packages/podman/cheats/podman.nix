{ ... }: {
  my.snavi-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run podman, a daemonless container engine that lets you manage containers, pods, and images";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "podman";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
