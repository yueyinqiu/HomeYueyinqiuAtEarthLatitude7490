{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      editor.lsp.display-messages = true;
    };

    languages = {
      language-server.pyright = {
        command = "${pkgs.pyright}/bin/pyright-langserver";
        args = [ "--stdio" ];
      };

      language-server.roslyn = {
        command = "${pkgs.roslyn-ls}/bin/Microsoft.CodeAnalysis.LanguageServer";
        args = [ "--stdio" ];
      };

      language = [
        {
          name = "python";
          language-servers = [ "pyright" ];
        }
        {
          name = "c-sharp";
          language-servers = [ "roslyn" ];
        }
      ];
    };
  };
}
