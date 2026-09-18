{ ... }: {
  programs.snavi.cheats = {
    "proxies-my-proxies-with" = {
      src = ./cheats;
      entry = "my-proxies-with.json";
    };
    "proxies-open-dashboard" = {
      src = ./cheats;
      entry = "open-dashboard.json";
    };
  };
}
