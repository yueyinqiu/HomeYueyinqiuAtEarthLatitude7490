{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixfmt
  ];

  imports = [
    ./cheats
  ];
}
