{ nur, ... }: {
  programs.home-manager-mihomo-manager.enable = true;
  mihomo-manager-mihomo-mixin = nur.yueyinqiu.mihomo-manager-mihomo-mixin;
}
