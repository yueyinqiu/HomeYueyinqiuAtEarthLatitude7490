{ pkgs, nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    lsp.enable = true;
    autocomplete.nvim-cmp.enable = true;

    debugger.nvim-dap.enable = true;
    debugger.nvim-dap = {
      ui.enable = true;
    };

    extraPackages = [
      pkgs.netcoredbg
      pkgs.python3Packages.debugpy
    ];

    terminal.toggleterm.enable = true;
    terminal.toggleterm = {
      lazygit.enable = true;
    };

    binds.whichKey.enable = true;

    filetree.neo-tree.enable = true;
    filetree.neo-tree = {
      setupOpts.enable_cursor_hijack = true;
    };

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

    theme = {
      enable = true;
      name = "onedark";
      style = "darker";
      transparent = false;
    };

    luaConfigRC.fcitx5-auto-inactivate = ''
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:n",
        callback = function()
          vim.system({ "fcitx5-remote", "-c" }, { detach = true })
        end,
      })
    '';
  };
}
