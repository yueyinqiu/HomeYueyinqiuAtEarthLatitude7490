{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
  ];

  imports = [
    ./cheats
  ];
}
