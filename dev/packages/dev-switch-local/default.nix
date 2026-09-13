{ name, pkgs, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    my-proxies-with for-nix-daemon home-manager switch --flake .
  '';
}
