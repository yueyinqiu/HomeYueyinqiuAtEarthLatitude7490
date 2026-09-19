{ nur, ... }: {
  programs.home-manager-mihomo-manager.enable = true;
  programs.home-manager-mihomo-manager.mihomo-manager-mihomo-mixin = nur.yueyinqiu.mihomo-manager-mihomo-mixin;
}
