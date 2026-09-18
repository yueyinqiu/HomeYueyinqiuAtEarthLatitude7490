{ ... }: {
  programs.snavi.cheats = {
    "proot-proot" = {
      src = ./cheats;
      entry = "proot.json";
    };
  };
}
