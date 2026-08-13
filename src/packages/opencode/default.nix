{ pkgs, ... }: {
  home.packages = with pkgs; [
    opencode
  ];

  imports = [
    ./cheats
  ];
}
