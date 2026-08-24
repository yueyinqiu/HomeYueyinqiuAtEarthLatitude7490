{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
        lspconfig.enable = true;
      };

      # Python development (LSP/format/debug/diagnostics)
      vim.languages = {
        enableTreesitter = true;
        enableFormat = true;
        enableDAP = true;
        enableExtraDiagnostics = true;

        python = {
          enable = true;
          lsp.servers = [ "basedpyright" "ruff" ];
          format.type = [ "ruff" "ruff-fix" "isort" "black" ];
          extraDiagnostics.types = [ "mypy" ];
          dap.debugger = [ "debugpy" ];
        };
      };
    };
  };
}
