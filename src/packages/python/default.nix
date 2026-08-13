{ pkgs, ... }: {
  home.packages = with pkgs; [
    python314
  ];

  imports = [
    ./cheats
  ];
}
