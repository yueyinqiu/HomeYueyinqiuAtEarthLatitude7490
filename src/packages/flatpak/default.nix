{ flatpaks, ... }: {
  imports = [
    flatpaks.homeModules.default
    ./cheats
  ];

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
  };
}
