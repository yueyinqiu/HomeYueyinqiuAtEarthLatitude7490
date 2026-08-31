{
  pkgs,
  nvf,
  ...
}: {
  imports = [
    nvf.homeManagerModules.default

    ./languages
    ./cheats
  ];

  home.packages = [
    (pkgs.writeShellApplication {
      name = "v";
      text = ''
        exec nvim "$@"
      '';
    })
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    viAlias = true;
    vimAlias = true;

    lsp = {
      enable = true;

      formatOnSave = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      lspsaga.enable = true;
      trouble.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
    };

    diagnostics = {
      enable = true;
      config = {
        # Show more context for actionable issues, and keep noise low for info/hints.
        underline = true;
        signs = {
          severity = {
            max = 2;
          };
        };
        virtual_text = false;
        virtual_lines = {
          severity = {
            max = 2;
          };
        };
        update_in_insert = true;
      };

      nvim-lint.enable = true;
    };

    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };
    visuals = {
      satellite-nvim.enable = true;
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
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

    autocomplete = {
      blink-cmp = {
        enable = true;
        setupOpts.signature.enabled = true;
        setupOpts.signature.trigger.show_on_keyword = true;
      };
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
