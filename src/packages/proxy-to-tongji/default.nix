{ ... }: {
  programs.home-manager-mihomo-manager.instances.to-tongji = {
    port = 11410;
    configuration = ./config;
  };
}
