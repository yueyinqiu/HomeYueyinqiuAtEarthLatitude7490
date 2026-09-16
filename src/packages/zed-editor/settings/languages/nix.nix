{ ... }:
{
  programs.zed-editor.userSettings.lsp.nixd = {
    binary = {
      path = "${pkgs.nixd}/bin/nixd";
    };
  };
  
  programs.zed-editor.userSettings.languages.Nix = {
    language_servers = [ "nixd" ];
  };
}
