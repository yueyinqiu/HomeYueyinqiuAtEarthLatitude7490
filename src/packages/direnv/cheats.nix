{ ... }: {
  programs.snavi.cheats = {
    "direnv-allow" = {
      src = ./cheats;
      entry = "allow.json";
    };
    "direnv-status" = {
      src = ./cheats;
      entry = "status.json";
    };
  };
}
