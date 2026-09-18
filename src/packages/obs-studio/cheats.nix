{ ... }: {
  programs.snavi.cheats = {
    "obs-studio-obs" = {
      src = ./cheats;
      entry = "obs.json";
    };
  };
}
