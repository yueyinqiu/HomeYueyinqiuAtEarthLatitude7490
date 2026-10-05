{ pkgs, ... }:
let
  texlive = "${pkgs.texliveFull}/bin";
in
{
  programs.vscode.profiles.default.userSettings = {
    "latex-workshop.latex.tools" = [
      {
        name = "latexmk";
        command = "${texlive}/latexmk";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-pdf"
          "-outdir=%OUTDIR%"
          "-auxdir=%AUXDIR%"
          "%DOC%"
        ];
      }
      {
        name = "lualatexmk";
        command = "${texlive}/latexmk";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-lualatex"
          "-outdir=%OUTDIR%"
          "-auxdir=%AUXDIR%"
          "%DOC%"
        ];
      }
      {
        name = "xelatexmk";
        command = "${texlive}/latexmk";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "-xelatex"
          "-outdir=%OUTDIR%"
          "-auxdir=%AUXDIR%"
          "%DOC%"
        ];
      }
      {
        name = "latexmk_rconly";
        command = "${texlive}/latexmk";
        args = [ "%DOC%" ];
      }
      {
        name = "pdflatex";
        command = "${texlive}/pdflatex";
        args = [
          "-synctex=1"
          "-interaction=nonstopmode"
          "-file-line-error"
          "%DOC%"
        ];
      }
      {
        name = "bibtex";
        command = "${texlive}/bibtex";
        args = [ "%DOCFILE%" ];
      }
      {
        name = "rnw2tex";
        command = "${pkgs.R}/bin/Rscript";
        args = [
          "-e"
          "knitr::opts_knit$set(concordance = TRUE); knitr::knit('%DOCFILE_EXT%')"
        ];
      }
      {
        name = "jnw2tex";
        command = "${pkgs.julia}/bin/julia";
        args = [
          "-e"
          "using Weave; weave(\"%DOC_EXT%\", doctype=\"tex\")"
        ];
      }
      {
        name = "jnw2texminted";
        command = "${pkgs.julia}/bin/julia";
        args = [
          "-e"
          "using Weave; weave(\"%DOC_EXT%\", doctype=\"texminted\")"
        ];
      }
      {
        name = "pnw2tex";
        command = "${pkgs.python3Packages.pweave}/bin/pweave";
        args = [
          "-f"
          "tex"
          "%DOC_EXT%"
        ];
      }
      {
        name = "pnw2texminted";
        command = "${pkgs.python3Packages.pweave}/bin/pweave";
        args = [
          "-f"
          "texminted"
          "%DOC_EXT%"
        ];
      }
      {
        name = "tectonic";
        command = "${pkgs.tectonic}/bin/tectonic";
        args = [
          "--synctex"
          "--keep-logs"
          "--print"
          "%DOC%.tex"
        ];
      }
    ];

    # 辅助工具
    "latex-workshop.kpsewhich.path" = "${texlive}/kpsewhich";
    "latex-workshop.synctex.path" = "${texlive}/synctex";
    "latex-workshop.texdoc.path" = "${texlive}/texdoc";
    "latex-workshop.texcount.path" = "${texlive}/texcount";

    # 清理（clean.method 默认 "command"，即 latexmk -c）
    "latex-workshop.latex.clean.command" = "${texlive}/latexmk";

    # 格式化
    "latex-workshop.formatting.latexindent.path" = "${texlive}/latexindent";
    "latex-workshop.formatting.tex-fmt.path" = "${pkgs.tex-fmt}/bin/tex-fmt";
    "latex-workshop.formatting.badness.path" = "${pkgs.badness}/bin/badness";

    # 代码检查
    "latex-workshop.linting.chktex.exec.path" = "${texlive}/chktex";
    "latex-workshop.linting.lacheck.exec.path" = "${texlive}/lacheck";
    "latex-workshop.linting.badness.exec.path" = "${pkgs.badness}/bin/badness";
  };

}
