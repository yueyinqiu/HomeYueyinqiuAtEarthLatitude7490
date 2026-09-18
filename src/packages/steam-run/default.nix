{
  pkgs,
  ...
}:
{
  imports = [
    ./cheats.nix
  ];

  home.packages = [
    pkgs.steam-run
  ];
}
