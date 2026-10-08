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

  xdg.desktopEntries."ghostty-inode-directory" = {
    name = "Ghostty (Open Directory)";
    exec = "${config.programs.ghostty.package}/bin/ghostty --working-directory=%f";
    mimeType = [ "inode/directory" ];
    noDisplay = true;
    terminal = false;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = "ghostty-open-dir.desktop";
    };
  };
}
