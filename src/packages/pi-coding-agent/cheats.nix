{ ... }: {
  programs.snavi.cheats = {
    "pi-resume" = {
      src = ./cheats;
      entry = "resume.json";
    };
    "pi-start" = {
      src = ./cheats;
      entry = "start.json";
    };
  };
}
