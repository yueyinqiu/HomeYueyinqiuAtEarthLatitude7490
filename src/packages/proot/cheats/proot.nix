{ ... }: {
  my.snavi-global-cheats = [
    {
      cheat = builtins.toJSON {
        Description = "run proot, a user-space implementation of chroot, mount --bind, and binfmt_misc";
        Command = [
          {
            "$type" = "CommandTokenLiteral";
            Value = "proot";
          }
        ];
        ExtraArguments = true;
      };
    }
  ];
}
