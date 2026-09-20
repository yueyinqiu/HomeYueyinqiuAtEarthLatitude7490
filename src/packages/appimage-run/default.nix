{
  pkgs,
  ...
}:
{
  imports = [
    ./cheats.nix
  ];

  home.packages = [
    pkgs.appimage-run
  ];
}
