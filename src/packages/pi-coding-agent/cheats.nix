{ ... }: {
  programs.snavi.cheats = {
    "pi-coding-agent-pi" = {
      src = ./cheats;
      entry = "pi.json";
    };
  };
}
