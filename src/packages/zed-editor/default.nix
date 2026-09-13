{ pkgs, ... }: {
  programs.zed-editor.enable = true;
  programs.zed-editor.userSettings = {
    lsp.roslyn.binary = {
      path = "${pkgs.roslyn-ls}/bin/Microsoft.CodeAnalysis.LanguageServer";
      arguments = [ "--stdio" "--autoLoadProjects" ];
    };
    lsp.package-version-server.binary = {
      path = "${pkgs.lsp-package-version-server}/bin/package-version-server";
    };
  };
  
  home.packages = [
    (pkgs.writeShellApplication {
      name = "z";
      text = ''
        exec zeditor "$@"
      '';
    })
  ];
}
