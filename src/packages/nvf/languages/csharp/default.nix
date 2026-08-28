{...}: {
  programs.nvf.settings.vim.languages.csharp = {
    enable = true;
    lsp.servers = ["roslyn-ls"];
    extensions.roslyn-nvim.enable = true;
    # https://github.com/NotAShelf/nvf/issues/1673
    extensions.roslyn-nvim.setupOpts.extensions.razor.enabled = false;
  };
}
