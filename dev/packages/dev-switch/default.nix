{ pkgs, ... }:
{
  packages = [
    (pkgs.writeShellApplication {
      name = "dev-switch";
      text = ''
        mihomo-manager with for-nix-daemon home-manager switch --flake .
      '';
    })
  ];
}
