{ pkgs, ... }: {
  home.packages = with pkgs; [
    qq
  ];
  imports = [
    ./cheats
  ];
}
