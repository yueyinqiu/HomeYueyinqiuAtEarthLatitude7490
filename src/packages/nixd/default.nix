{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixd
  ];

  imports = [
    ./cheats
  ];

  my.navi-cheats.nixd = ''
    # run nixd, a feature-rich nix language server interoperating with C++ nix.
    nixd <args>
  '';
}
