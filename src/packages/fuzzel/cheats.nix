{ ... }: {
  programs.snavi.cheats = {
    "fuzzel-fuzzel" = {
      src = ./cheats;
      entry = "fuzzel.json";
    };
  };
}
