{ pkgs, ... }: {
  programs.zed-editor.enable = true;
  programs.zed-editor.userSettings = {
    lsp.roslyn.binary = {
      "path" = "${pkgs.roslyn-ls}/bin/Microsoft.CodeAnalysis.LanguageServer";
      "arguments" = [ "--stdio" ];
    };
  };
}
