{ pkgs, niri, ... }: {
  wayland.windowManager.niri = {
    enable = true;
    package = niri.niri;
    enableDefaultConfig = false;
    settings = {
      "screenshot-path" = null;
      "spawn-sh-at-startup" = "$HOME/.config/niri/spawn-at-startup.sh";
      _children = import ./window-rules.nix;
    };
  };

  xdg.configFile."niri/spawn-at-startup.sh" = {
    source = ./spawn-at-startup.sh;
    executable = true;
  };

  services.ssh-agent.enable = true;

  home.packages = [
    (pkgs.writeShellApplication {
      name = "n";
      text = ''
        exec ${niri.niri}/bin/niri-session
      '';
    })
  ];
  imports = [
    ./binds.nix
    ./cheats.nix
  ];
}
