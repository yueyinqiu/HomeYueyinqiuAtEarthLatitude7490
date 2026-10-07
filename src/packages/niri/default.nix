{ pkgs, niri, config, ... }: {
  imports = [
    ./settings
    ./cheats.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    package = niri.niri;
    enableDefaultConfig = false;
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "n";
      text = ''
        exec ${config.wayland.windowManager.niri.package}/bin/niri-session
      '';
    })
  ];
}
