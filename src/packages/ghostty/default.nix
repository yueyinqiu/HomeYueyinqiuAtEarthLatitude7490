{ ... }: {
  programs.ghostty.enable = true;
  programs.ghostty.settings = {
    confirm-close-surface = false;
    shell-integration-features = "ssh-env";
  };

  imports = [
    ./cheats
  ];
}
