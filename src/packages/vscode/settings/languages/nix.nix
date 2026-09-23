{ pkgs, ... }:
{
  programs.vscode.profiles.default.userSettings = {
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "${pkgs.nixd}/bin/nixd";
    "nix.formatterPath" = "${pkgs.nixfmt}/bin/nixfmt";
    "nix.serverSettings" = { };
  };
}
