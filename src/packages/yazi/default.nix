{ ... }: {
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
  imports = [
    ./cheats.nix
  ];
}
