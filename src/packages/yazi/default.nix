{ pkgs, ... }: {
  programs.yazi.enable = true;
  programs.yazi.enableBashIntegration = true;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
  imports = [
    ./cheats.nix
  ];

  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-termfilechooser
  ];
  xdg.configFile."xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
    default_dir=$HOME
    env=TERMCMD=ghostty --title="terminal-filechooser" -e
    open_mode=suggested
    save_mode=last
  '';
}
