{ ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yueyinqiu";
        email = "yueyinqiu@outlook.com";
      };
      alias = {
        ac = "!git add -A && git commit";
      };
    };
    lfs.enable = true;
  };

  imports = [
    ./cheats.nix
  ];
}
