{ pkgs, ... }: {
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  programs.yazi.plugins = {
    recycle-bin = {
      package = pkgs.yaziPlugins.recycle-bin;
      setup = true;
    };
  };

  imports = [
    ./cheats
  ];
}
