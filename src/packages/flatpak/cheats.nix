{ ... }: {
  programs.snavi.cheats = {
    "flatpak-flatpak" = {
      src = ./cheats;
      entry = "flatpak.json";
    };
  };
}
