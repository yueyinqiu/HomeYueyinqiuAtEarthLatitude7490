{ pkgs, ... }: {
  home.packages = with pkgs; [
    nb
  ];
  imports = [
    ./cheats
  ];
}
