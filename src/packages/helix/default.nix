{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    languages = {
      language-server.pyright = {
        command = "${pkgs.pyright}/bin/pyright-langserver";
        args = [ "--stdio" ];
      };

      language-server.csharp-ls = {
        command = "${pkgs.csharp-ls}/bin/csharp-ls";
        args = [ ];
      };

      language = [
        {
          name = "python";
          language-servers = [ "pyright" ];
        }
        {
          name = "c-sharp";
          language-servers = [ "csharp-ls" ];
        }
      ];
    };
  };
}
