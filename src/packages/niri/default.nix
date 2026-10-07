{ pkgs, niri, ... }: {
  # Manage niri entirely at the user level. We do NOT use `enableDefaultConfig`:
  # niri has no "unbind" primitive, so to be able to delete/override any default
  # key we spell out the full `binds` list ourselves (see binds.nix). The
  # input/layout/animations/hotkey-overlay sections are omitted because they
  # equal niri's built-in defaults and apply automatically when absent.
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

  # Startup script referenced by spawn-sh-at-startup above.
  xdg.configFile."niri/spawn-at-startup.sh" = {
    source = ./spawn-at-startup.sh;
    executable = true;
  };

  # Replace gnome-keyring's SSH agent with the stock OpenSSH agent so that
  # ForwardAgent / AddKeysToAgent keep working without gnome-keyring.
  services.ssh-agent.enable = true;

  # Desktop portal: the wayland.windowManager.niri module already sets
  # xdg.portal.enable + extraPortals (gnome) + niri's configPackages when
  # enabled, so we only need to make the xdg-desktop-portal.service actually
  # start for this user. systemd.user.packages links the unit into
  # ~/.local/share/systemd/user, which systemd --user scans.
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
    ./binds.nix
    ./cheats.nix
  ];
}
