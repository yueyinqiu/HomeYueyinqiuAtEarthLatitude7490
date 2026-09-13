{ pkgs, ... }:
{
  imports = [
    ./jsonc.nix
    ./nix.nix
    ./python.nix
    ./csharp.nix
  ];

  programs.zed-editor.userSettings.lsp.package-version-server = {
    binary = {
      path = "${pkgs.package-version-server}/bin/package-version-server";
    };
  };
}
