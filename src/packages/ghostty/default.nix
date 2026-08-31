{pkgs, ...}: {
  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    shell-integration-features = "ssh-env";
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "g";
      text = ''
        exec niri msg action spawn -- ghostty --working-directory="$PWD"'
      '';
    })
  ];

  imports = [
    ./cheats
  ];
}
