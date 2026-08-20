{ ... }: {
  imports = [
    ./packages
  ];

  home.username = "yueyinqiu";
  home.homeDirectory = "/home/yueyinqiu";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "26.05";
}
