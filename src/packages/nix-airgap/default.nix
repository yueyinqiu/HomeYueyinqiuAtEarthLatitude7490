{
  nix-airgap,
  ...
}:
{
  imports = [
    ./cheats.nix
  ];

  home.packages = [
    nix-airgap.airgap
  ];
}
