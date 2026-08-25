{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    lsp.enable = true;
    autocomplete.nvim-cmp.enable = true;

    debugger.nvim-dap.enable = true;
    debugger.nvim-dap = {
      ui.enable = true;
    };

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

    # Theme preview mode:
    # install several popular themes and provide :Theme / :ThemeNext / :ThemePrev commands.
    startPlugins = [
      "catppuccin"
      "tokyonight"
      "rose-pine"
      "onedark"
      "gruvbox"
      "oxocarbon"
    ];

    luaConfigRC.theme-preview = ''
      -- Theme preview helper. Use :Theme <tab> to switch.
      local themes = {}

      themes["catppuccin-mocha"] = function()
        vim.o.background = "dark"
        require("catppuccin").setup({
          flavour = "mocha",
          transparent_background = false,
          term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
      end

      themes["catppuccin-macchiato"] = function()
        vim.o.background = "dark"
        require("catppuccin").setup({
          flavour = "macchiato",
          transparent_background = false,
          term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
      end

      themes["catppuccin-frappe"] = function()
        vim.o.background = "dark"
        require("catppuccin").setup({
          flavour = "frappe",
          transparent_background = false,
          term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
      end

      themes["catppuccin-latte"] = function()
        vim.o.background = "light"
        require("catppuccin").setup({
          flavour = "latte",
          transparent_background = false,
          term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
      end

      themes["tokyonight-night"] = function()
        vim.o.background = "dark"
        require("tokyonight").setup({
          style = "night",
          transparent = false,
          styles = { sidebars = "dark", floats = "dark" },
        })
        vim.cmd.colorscheme("tokyonight-night")
      end

      themes["tokyonight-moon"] = function()
        vim.o.background = "dark"
        require("tokyonight").setup({
          style = "moon",
          transparent = false,
          styles = { sidebars = "dark", floats = "dark" },
        })
        vim.cmd.colorscheme("tokyonight-moon")
      end

      themes["tokyonight-storm"] = function()
        vim.o.background = "dark"
        require("tokyonight").setup({
          style = "storm",
          transparent = false,
          styles = { sidebars = "dark", floats = "dark" },
        })
        vim.cmd.colorscheme("tokyonight-storm")
      end

      themes["tokyonight-day"] = function()
        vim.o.background = "light"
        require("tokyonight").setup({
          style = "day",
          transparent = false,
          styles = { sidebars = "dark", floats = "dark" },
        })
        vim.cmd.colorscheme("tokyonight-day")
      end

      themes["rose-pine-main"] = function()
        vim.o.background = "dark"
        require("rose-pine").setup({
          dark_variant = "main",
          disable_background = false,
        })
        vim.cmd.colorscheme("rose-pine")
      end

      themes["rose-pine-moon"] = function()
        vim.o.background = "dark"
        require("rose-pine").setup({
          dark_variant = "moon",
          disable_background = false,
        })
        vim.cmd.colorscheme("rose-pine")
      end

      themes["rose-pine-dawn"] = function()
        vim.o.background = "light"
        require("rose-pine").setup({
          dark_variant = "dawn",
          disable_background = false,
        })
        vim.cmd.colorscheme("rose-pine")
      end

      themes["onedark-darker"] = function()
        vim.o.background = "dark"
        require("onedark").setup({ style = "darker", transparent = false })
        require("onedark").load()
      end

      themes["onedark-deep"] = function()
        vim.o.background = "dark"
        require("onedark").setup({ style = "deep", transparent = false })
        require("onedark").load()
      end

      themes["gruvbox-dark"] = function()
        vim.o.background = "dark"
        require("gruvbox").setup({ transparent_mode = false })
        vim.cmd.colorscheme("gruvbox")
      end

      themes["gruvbox-light"] = function()
        vim.o.background = "light"
        require("gruvbox").setup({ transparent_mode = false })
        vim.cmd.colorscheme("gruvbox")
      end

      themes["oxocarbon-dark"] = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("oxocarbon")
      end

      themes["oxocarbon-light"] = function()
        vim.o.background = "light"
        vim.cmd.colorscheme("oxocarbon")
      end

      local theme_names = vim.tbl_keys(themes)
      table.sort(theme_names)

      local function apply_theme(name)
        local fn = themes[name]
        if not fn then
          vim.notify("Unknown theme: " .. tostring(name), vim.log.levels.ERROR)
          return
        end
        local ok, err = pcall(fn)
        if not ok then
          vim.notify("Theme failed: " .. tostring(name) .. "\n" .. tostring(err), vim.log.levels.ERROR)
          return
        end
        vim.g.nvf_theme = name
      end

      vim.api.nvim_create_user_command("Theme", function(opts)
        local name = opts.args
        if name == nil or name == "" then
          vim.notify("Available themes:\n  " .. table.concat(theme_names, "\n  "))
          return
        end
        apply_theme(name)
      end, {
        nargs = "?",
        complete = function(_, line)
          -- basic completion: return all, nvim will filter.
          return theme_names
        end,
      })

      vim.api.nvim_create_user_command("ThemeNext", function()
        local cur = vim.g.nvf_theme or ""
        local idx = 0
        for i, v in ipairs(theme_names) do
          if v == cur then
            idx = i
            break
          end
        end
        idx = (idx % #theme_names) + 1
        apply_theme(theme_names[idx])
      end, { nargs = 0 })

      vim.api.nvim_create_user_command("ThemePrev", function()
        local cur = vim.g.nvf_theme or ""
        local idx = 0
        for i, v in ipairs(theme_names) do
          if v == cur then
            idx = i
            break
          end
        end
        idx = idx - 1
        if idx <= 0 then
          idx = #theme_names
        end
        apply_theme(theme_names[idx])
      end, { nargs = 0 })

      -- Default: soft, readable dark theme.
      if vim.g.nvf_theme == nil then
        apply_theme("catppuccin-macchiato")
      end
    '';
  };
}
