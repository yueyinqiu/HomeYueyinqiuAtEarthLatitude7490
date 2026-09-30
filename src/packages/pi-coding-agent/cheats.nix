{ ... }: {
  programs.snavi.cheats = {
    "pi-pi" = {
      src = ./cheats;
      entry = "pi.json";
    };
  };
}
