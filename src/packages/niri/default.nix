{pkgs, ...}: {
  xdg.configFile."niri/config-window-rules.kdl".source = ./config-window-rules.kdl;
  xdg.configFile."niri/config-binds.kdl".source = ./config-binds.kdl;
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  xdg.configFile."niri/spawn-at-startup.sh" = {
    source = ./spawn-at-startup.sh;
    executable = true;
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "n";
      text = ''
        exec niri-session
      '';
    })
  ];
  imports = [
    ./cheats
  ];
}
