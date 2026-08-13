{ pkgs, ... }: {
  home.packages = with pkgs; [
    htop
  ];
  imports = [
    ./cheats
  ];
}
