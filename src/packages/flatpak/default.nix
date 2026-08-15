{ pkgs, flatpaks, ... }: {
  imports = [
    flatpaks.homeModules.default
    ./cheats
  ];

  home.packages = [
    pkgs.flatpak
  ];

  services.flatpak = {
    enable = true;
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
  };
}
