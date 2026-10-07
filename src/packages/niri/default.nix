{ pkgs, niri, ... }: {
  wayland.windowManager.niri = {
    enable = true;
    package = niri.niri;
    enableDefaultConfig = false;
    checkConfig = false;
    settings = { };
  };

  xdg.configFile."niri/config-window-rules.kdl".source = ./config-window-rules.kdl;
  xdg.configFile."niri/config-binds.kdl".source = ./config-binds.kdl;
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."niri/spawn-at-startup.sh" = {
    source = ./spawn-at-startup.sh;
    executable = true;
  };

  # services.ssh-agent.enable = true;

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  # };
  # systemd.user.packages = [ pkgs.xdg-desktop-portal ];

  home.packages = [
    (pkgs.writeShellApplication {
      name = "n";
      text = ''
        exec niri-session
      '';
    })
  ];
  imports = [
    ./cheats.nix
  ];
}
