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

      language-server.omnisharp = {
        command = "${pkgs.omnisharp-roslyn}/bin/OmniSharp";
        args = [ "--languageserver" ];
      };

      language = [
        {
          name = "python";
          language-servers = [ "pyright" ];
        }
        {
          name = "c-sharp";
          language-servers = [ "omnisharp" ];
        }
      ];
    };
  };
}
