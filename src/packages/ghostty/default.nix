{ pkgs, config, ... }: {
  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    shell-integration-features = "ssh-env";
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "g";
      text = ''
        exec niri msg action spawn -- ghostty --working-directory="$PWD"
      '';
    })
  ];

  imports = [
    ./cheats.nix
  ];

  xdg.desktopEntries."ghostty-open-dir" = {
    name = "Ghostty (Open Directory)";
    exec = "${config.programs.ghostty.package}/bin/ghostty --working-directory=%f";
    icon = "com.mitchellh.ghostty";
    mimeType = [ "inode/directory" ];
    categories = [ "System" "TerminalEmulator" ];
    noDisplay = true;
    terminal = false;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "ghostty-open-dir.desktop";
    };
  };
}
