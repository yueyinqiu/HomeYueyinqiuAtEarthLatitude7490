{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "vs2019-dark-soft";
      editor = {
        lsp.display-messages = true;
      };
    };

    themes = {
      vs2019-dark-soft =
        let
          transparent = "none";
          bg0 = "#1e1e1e";
          bg1 = "#252526";
          bg2 = "#2d2d2d";
          sel = "#3a3d41";
          fg0 = "#d4d4d4";
          fg1 = "#cccccc";
          gray = "#808080";
          comment = "#6a9955";
          red = "#f44747";
          orange = "#ce9178";
          green = "#b5cea8";
          yellow = "#dcdcaa";
          teal = "#4ec9b0";
          purple = "#c586c0";
          blue = "#569cd6";
        in
        {
          "ui.background" = { bg = bg0; fg = fg0; };
          "ui.text" = fg0;

          "ui.menu" = { bg = bg1; fg = fg1; };
          "ui.menu.selected" = { bg = sel; modifiers = [ "bold" ]; };
          "ui.popup" = { bg = bg1; fg = fg1; };

          "ui.linenr" = { fg = gray; bg = transparent; };
          "ui.linenr.selected" = { fg = fg0; modifiers = [ "bold" ]; };
          "ui.gutter" = { bg = bg0; };

          # Avoid the default bright-blue selection.
          "ui.selection" = { bg = sel; };
          "ui.selection.primary" = { bg = sel; };

          "ui.statusline" = { fg = fg0; bg = bg2; };
          "ui.statusline.inactive" = { fg = gray; bg = bg1; };
          "ui.help" = { fg = fg0; bg = bg1; };

          "ui.cursor" = { modifiers = [ "reversed" ]; };
          "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };

          "comment" = { fg = comment; };
          "string" = { fg = orange; };
          "constant.numeric" = { fg = green; };
          "constant.character.escape" = { fg = yellow; };
          "keyword" = { fg = purple; };
          "type" = { fg = teal; };
          "function" = { fg = yellow; };
          "variable" = { fg = fg0; };
          "variable.other.member" = { fg = fg0; };
          "namespace" = { fg = fg0; };
          "label" = { fg = fg0; };
          "special" = { fg = blue; };

          "diff.plus" = { fg = green; };
          "diff.delta" = { fg = yellow; };
          "diff.minus" = { fg = red; };

          "warning" = { fg = yellow; };
          "error" = { fg = red; };
          "info" = { fg = blue; };
          "hint" = { fg = gray; };
          "debug" = { fg = gray; };

          "diagnostic" = { modifiers = [ "underlined" ]; };
        };
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
