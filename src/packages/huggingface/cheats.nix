{ ... }: {
  programs.snavi.cheats = {
    "huggingface-with-proxy" = {
      src = ./cheats;
      entry = "with-proxy.json";
    };
  };
}
