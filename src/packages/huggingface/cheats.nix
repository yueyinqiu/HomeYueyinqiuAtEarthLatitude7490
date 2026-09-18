{ ... }: {
  programs.snavi.cheats = {
    "huggingface-niri-spawn" = {
      src = ./cheats;
      entry = "niri-spawn.json";
    };
  };
}
