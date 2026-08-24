{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  programs.nvf.settings = {
    vim.autocomplete.nvim-cmp.enable = true;

    vim.treesitter.enable = true;

    vim.languages.python = {
      enable = true;
      lsp.enable = true;
      format.enable = true;
    };
  };
}
