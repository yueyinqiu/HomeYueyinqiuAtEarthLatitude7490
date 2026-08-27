{ ... }: {
  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    shell-integration-features = "ssh-env";
  };

  home.shellAliases.g = ''niri msg action spawn -- ghostty --working-directory="$PWD"'';

  imports = [
    ./cheats
  ];
}
