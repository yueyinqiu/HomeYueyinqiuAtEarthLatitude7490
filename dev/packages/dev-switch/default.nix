{ name, pkgs, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    home-manager-mihomo-manager with for-nix-daemon home-manager switch --flake .
  '';
}
