{ pkgs, niri, ... }: {
  imports = [
    ./settings
    ./cheats.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    package = niri.niri;
    enableDefaultConfig = false;
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
}
