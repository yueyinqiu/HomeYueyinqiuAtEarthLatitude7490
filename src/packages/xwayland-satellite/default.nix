{ pkgs, ... }: {
  home.packages = with pkgs; [
    xwayland-satellite
  ];
  imports = [
    ./cheats
  ];
}
