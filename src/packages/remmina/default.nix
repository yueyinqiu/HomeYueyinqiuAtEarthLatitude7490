{ pkgs, ... }: {
  home.packages = with pkgs; [
    remmina
  ];

  imports = [
    ./cheats
  ];
}
