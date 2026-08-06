{ ... }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
  };

  imports = [
    ./cheats
  ];

  my.navi-cheats.direnv = ''
    # grant permission to run the current .envrc in this directory
    direnv allow

    # check direnv status and currently loaded environment variables
    direnv status
  '';
}
