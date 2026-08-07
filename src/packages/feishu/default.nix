{ pkgs, ... }: {
  home.packages = with pkgs; [
    feishu
  ];

  imports = [
    ./cheats
  ];
}
