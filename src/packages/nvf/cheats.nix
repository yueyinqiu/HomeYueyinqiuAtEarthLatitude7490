{ ... }: {
  programs.snavi.cheats = {
    "nvf-nvim" = {
      src = ./cheats;
      entry = "nvim.json";
    };
  };
}
