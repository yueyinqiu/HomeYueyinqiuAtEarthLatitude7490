{ pkgs, ... }: {
  home.packages = with pkgs; [
    mpv
  ];
  imports = [
    ./cheats
  ];
}
