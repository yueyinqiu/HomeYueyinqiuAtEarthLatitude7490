{ pkgs, config, ... }: 
let 
  xdg-open-directory = "ghostty-inode-directory";
in 
{
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

  xdg.desktopEntries.${xdg-open-directory} = {
    name = "Ghostty (Open Directory)";
    exec = "${config.programs.ghostty.package}/bin/ghostty --working-directory=%f";
    mimeType = [ "inode/directory" ];
    noDisplay = true;
    terminal = false;
  };

  xdg.mimeApps = {
    defaultApplications = {
      "inode/directory" = "${xdg-open-directory}.desktop";
    };
  };
}
