{ name, pkgs, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    mihomo-manager with for-nix-daemon home-manager switch --flake .
  '';
}
