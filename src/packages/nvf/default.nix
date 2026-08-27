{ nvf, ... }: {
  imports = [
    nvf.homeManagerModules.default
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    luaConfigRC.fcitx5-auto-inactivate = ''
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:n",
        callback = function()
          vim.system({ "fcitx5-remote", "-c" }, { detach = true })
        end,
      })
    '';


    viAlias = true;
    vimAlias = true;

    opts.expandtab = true;

    lsp = {
      enable = true;

      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = true;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = false;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      presets.harper.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix.enable = true;
      markdown.enable = true;

      bash.enable = true;
      json.enable = true;
      python.enable = true;
      toml.enable = true;
      xml.enable = true;
      env.enable = true;

      csharp.enable = true;
    };

    visuals = {
      nvim-scrollbar.enable = true;
      satellite-nvim.enable = false;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;

      highlight-undo.enable = true;
      blink-indent.enable = true;
      indent-blankline.enable = true;
    };

    statusline = {
      lualine = {
        enable = true;
        theme = "auto";

        integrations.breadcrumbs = {
          vanilla.enable = false;
          nvim-navic.enable = true;
          navbuddy.enable = true;
          lspsaga.enable = false;
        };
      };
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = false;
    };

    autopairs.nvim-autopairs.enable = true;

    autocomplete = {
      blink-cmp.enable = true;
    };

    snippets.luasnip.enable = true;

    filetree = {
      neo-tree = {
        enable = true;
        setupOpts.filesystem.filtered_items.visible = true;
      };
    };

    tabline = {
      nvimBufferline.enable = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Neotree focus<CR>";
        desc = "Focus Neo-tree";
      }
    ];

    treesitter.context.enable = true;

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    telescope.enable = true;

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false;
      neogit.enable = true;
    };

    minimap = {
      minimap-vim.enable = true;
    };

    dashboard = {
      dashboard-nvim.enable = false;
      alpha.enable = true;
    };

    notify = {
      nvim-notify.enable = true;
    };

    projects = {
      project-nvim.enable = true;
    };

    utility = {
      ccc.enable = false;
      vim-wakatime.enable = false;
      diffview-nvim.enable = true;
      yanky-nvim.enable = false;
      qmk-nvim.enable = false; # requires hardware specific options
      icon-picker.enable = true;
      surround.enable = true;
      leetcode-nvim.enable = true;
      multicursors.enable = true;
      smart-splits.enable = true;
      undotree.enable = true;
      nvim-biscuits.enable = false;
      grug-far-nvim.enable = true;

      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = true;
      };
      images = {
        image-nvim.enable = false;
        img-clip.enable = true;
      };
    };

    notes = {
      neorg.enable = false;
      orgmode.enable = false;
      todo-comments.enable = true;
    };

    terminal = {
      toggleterm = {
        enable = true;
        lazygit.enable = true;
      };
    };

    ui = {
      borders.enable = true;
      dropbar-nvim.enable = false;
      noice.enable = true;
      colorizer.enable = true;
      modes-nvim.enable = false; # the theme looks terrible with catppuccin
      illuminate.enable = true;
      smartcolumn = {
        enable = true;
        setupOpts.custom_colorcolumn = {
          # this is a freeform module, it's `buftype = int;` for configuring column position
          nix = "110";
          ruby = "120";
          java = "130";
          go = [
            "90"
            "130"
          ];
        };
      };
      fastaction.enable = true;
    };

    assistant = {
      chatgpt.enable = false;
      copilot = {
        enable = false;
        cmp.enable = true;
      };
      codecompanion-nvim.enable = false;
      avante-nvim.enable = true;
    };

    session = {
      nvim-session-manager.enable = false;
    };

    gestures = {
      gesture-nvim.enable = false;
    };

    comments = {
      comment-nvim.enable = true;
    };

    presence = {
      neocord.enable = false;
      cord-nvim.enable = false;
    };
  };
}
