{ pkgs, ... }: {
  home.packages = with pkgs; [
    ouch
  ];

  imports = [
    ./cheats
  ];
}
