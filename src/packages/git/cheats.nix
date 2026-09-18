{ ... }: {
  programs.snavi.cheats = {
    "git-add-commit" = {
      src = ./cheats;
      entry = "add-commit.json";
    };
    "git-reset-soft" = {
      src = ./cheats;
      entry = "reset-soft.json";
    };
  };
}
