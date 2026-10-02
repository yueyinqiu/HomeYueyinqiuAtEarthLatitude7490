{ pkgs, ... }: {
  home.packages = [
    pkgs.wemeet
  ];

  imports = [
    ./cheats.nix
  ];
}
