{ pkgs, ... }: {
  imports = [
    ./cheats.nix
  ];

  home.packages = with pkgs; [
    jq
  ];
}
