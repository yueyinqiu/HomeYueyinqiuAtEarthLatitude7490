{ ... }: {
  programs.snavi.cheats = {
    "syncthing-get-address" = {
      src = ./cheats;
      entry = "get-address.json";
    };
  };
}
