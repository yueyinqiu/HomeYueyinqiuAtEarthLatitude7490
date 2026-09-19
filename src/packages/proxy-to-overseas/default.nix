{ nur, ... }: {
  programs.home-manager-mihomo-manager.instances.to-overseas = {
    port = 40426;
    configuration = ./config;
  };
}
