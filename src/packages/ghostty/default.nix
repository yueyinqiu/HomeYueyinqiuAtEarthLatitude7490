{ ... }: {
  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    confirm-close-surface = false;
    shell-integration-features = "ssh-env";
  };

  home.shellAliases.g = ''niri msg action spawn -- ghostty --working-directory="$PWD"'';

  imports = [
    ./cheats
  ];
}
