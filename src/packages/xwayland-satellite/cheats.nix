{ ... }: {
  programs.snavi.cheats = {
    "xwayland-satellite-xwayland-satellite" = {
      src = ./cheats;
      entry = "xwayland-satellite.json";
    };
  };
}
