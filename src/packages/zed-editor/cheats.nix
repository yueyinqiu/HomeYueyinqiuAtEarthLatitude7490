{ ... }: {
  programs.snavi.cheats = {
    "zed-editor-zed" = {
      src = ./cheats;
      entry = "zed.json";
    };
  };
}
