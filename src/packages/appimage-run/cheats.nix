{ ... }: {
  programs.snavi.cheats = {
    "appimage-run-appimage-run" = {
      src = ./cheats;
      entry = "appimage-run.json";
    };
  };
}
