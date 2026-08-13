{ pkgs, ... }: {
  home.packages = with pkgs; [
    btop
  ];
  imports = [
    ./cheats
  ];
}
