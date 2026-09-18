{ ... }: {
  programs.snavi.cheats = {
    "xdg-user-dir" = {
      src = ./cheats;
      entry = "user-dir.json";
    };
  };
}
