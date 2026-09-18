{ ... }: {
  programs.snavi.cheats = {
    "ouch-compress" = {
      src = ./cheats;
      entry = "compress.json";
    };
    "ouch-decompress" = {
      src = ./cheats;
      entry = "decompress.json";
    };
    "ouch-list" = {
      src = ./cheats;
      entry = "list.json";
    };
  };
}
