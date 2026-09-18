{ ... }: {
  programs.snavi.cheats = {
    "jq-jq" = {
      src = ./cheats;
      entry = "jq.json";
    };
  };
}
