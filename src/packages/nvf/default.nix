{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    lsp.enable = true;
    autocomplete.nvim-cmp.enable = true;

    debugger.nvim-dap.enable = true;
    debugger.nvim-dap.ui.enable = true;

    terminal.toggleterm.enable = true;
    terminal.toggleterm.lazygit.enable = true;

    binds.whichKey.enable = true;
    
    filetree.neo-tree.enable = true;
    filetree.neo-tree.setupOpts.enable_cursor_hijack = true;

    languages.enableFormat = true;
    languages.enableTreesitter = true;

    languages.nix = {
      enable = true;
      lsp.servers = [ "nixd" ];
    };

    languages.python.enable = true;
    languages.lua.enable = true;

    languages.csharp = {
      enable = true;
      lsp.servers = [ "roslyn-ls" ];
      extensions.roslyn-nvim.enable = true;
      # https://github.com/NotAShelf/nvf/issues/1673
      extensions.roslyn-nvim.setupOpts.extensions.razor.enabled = false;
    };
  };
}
