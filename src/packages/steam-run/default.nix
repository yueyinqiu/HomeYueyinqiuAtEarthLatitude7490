{
  pkgs,
  ...
}:
{
  imports = [
    ./cheats
  ];

  home.packages = [
    pkgs.steam-run
  ];
}
