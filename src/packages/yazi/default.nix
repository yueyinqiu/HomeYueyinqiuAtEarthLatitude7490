{ ... }: {
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  imports = [
    ./cheats
  ];
}
