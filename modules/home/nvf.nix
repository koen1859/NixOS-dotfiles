{
  config,
  pkgs,
  ...
}: {
  programs.nvf = {
    enable = true;
    settings.vim = {
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      useSystemClipboard = true;
      undoFile.enable = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        wrap = false;
        scrolloff = 8;
        sidescrolloff = 8;
      };

      startPlugins = [
        pkgs.vimPlugins.undotree
      ];

      lazy.plugins = {
        "zellij-nav.nvim" = {
          package = pkgs.vimPlugins.zellij-nav-nvim;
          setupModule = "zellij-nav";
          setupOpts = {};
        };
      };

      keymaps = [
        {
          key = "<leader>ldt";
          mode = ["n"];
          action = ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>";
          desc = "Toggle inline diagnostics";
        }
        {
          key = "<leader>u";
          mode = ["n"];
          action = ":UndotreeToggle<cr>";
          desc = "Open undo tree";
        }
        {
          key = "<leader>cc";
          mode = ["n"];
          action = ":CodeCompanionChat<CR>";
          desc = "Open Code Companion chat";
        }
        {
          key = "<C-k>";
          mode = ["n"];
          action = "<cmd>ZellijNavigateUp<cr>";
          desc = "Navigate up";
        }
        {
          key = "<C-j>";
          mode = ["n"];
          action = "<cmd>ZellijNavigateDown<cr>";
          desc = "Navigate down";
        }
        {
          key = "<C-h>";
          mode = ["n"];
          action = "<cmd>ZellijNavigateLeft<cr>";
          desc = "Navigate left";
        }
        {
          key = "<C-l>";
          mode = ["n"];
          action = "<cmd>ZellijNavigateRight<cr>";
          desc = "Navigate right";
        }
        {
          key = "<leader>nh";
          mode = ["n"];
          action = ":nohl<CR>";
          desc = "Clear search highlights";
        }
        {
          key = "<leader>ff";
          mode = ["n"];
          action = "<cmd>Telescope find_files<cr>";
          desc = "Search files by name";
        }
        {
          key = "<leader>lg";
          mode = ["n"];
          action = "<cmd>Telescope live_grep<cr>";
          desc = "Search files by contents";
        }
        {
          key = "gd";
          mode = ["n"];
          action = "<cmd>Telescope lsp_definitions<CR>";
          desc = "Go to definition";
        }
        {
          key = "gr";
          mode = ["n"];
          action = "<cmd>Telescope lsp_references<CR>";
          desc = "Go to references";
        }
        {
          key = "gI";
          mode = ["n"];
          action = "<cmd>Telescope lsp_implementations<CR>";
          desc = "Go to implementations";
        }
        {
          key = "<leader>fe";
          mode = ["n"];
          action = "<cmd>Neotree toggle<cr>";
          desc = "File browser toggle";
        }
        {
          key = "<Up>";
          mode = ["n"];
          action = ":resize -2<CR>";
          desc = "Horizontal resize";
        }
        {
          key = "<Down>";
          mode = ["n"];
          action = ":resize +2<CR>";
          desc = "Horizontal resize";
        }
        {
          key = "<Left>";
          mode = ["n"];
          action = ":vertical resize -2<CR>";
          desc = "Vertical resize";
        }
        {
          key = "<Right>";
          mode = ["n"];
          action = ":vertical resize +2<CR>";
          desc = "Vertical resize";
        }
        {
          key = "<Tab>";
          mode = ["n"];
          action = ":bnext<CR>";
          desc = "Next buffer";
        }
        {
          key = "<S-Tab>";
          mode = ["n"];
          action = ":bprevious<CR>";
          desc = "Previous buffer";
        }
        {
          key = "<C-q>";
          mode = ["n"];
          action = ":bdelete!<CR>";
          desc = "Close buffer";
        }
      ];

      telescope.enable = true;

      spellcheck = {
        enable = true;
      };

      lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        lspSignature.enable = true;
        otter-nvim.enable = false;
        lsplines.enable = false;
        nvim-docs-view.enable = false;
      };

      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = false;

        rust.enable = true;
        sql.enable = true;
        nix.enable = true;
        clang.enable = true;
        zig.enable = true;
        python.enable = true;
        r.enable = true;
        markdown.enable = true;
        ts.enable = true;
        html.enable = true;
        dart.enable = true;
        go.enable = true;
        lua.enable = true;
        php.enable = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "base16";
        };
      };

      autopairs.nvim-autopairs.enable = true;

      autocomplete.nvim-cmp.enable = true;
      snippets.luasnip.enable = true;

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = false;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false; # throws an annoying debug message
      };

      projects.project-nvim.enable = true;
      dashboard.dashboard-nvim.enable = true;

      filetree.neo-tree.enable = true;

      notify = {
        nvim-notify.enable = true;
        nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };

      utility = {
        ccc.enable = false;
        vim-wakatime.enable = false;
        icon-picker.enable = true;
        surround.enable = false;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = true;
          precognition.enable = false;
        };

        images = {
          image-nvim.enable = false;
        };
      };

      assistant = {
        chatgpt.enable = false;
        copilot = {
          enable = true;
          cmp.enable = false;
        };
        codecompanion-nvim.enable = true;
      };

      ui = {
        borders.enable = false;
        noice.enable = false;
        colorizer.enable = true;
        illuminate.enable = true;
        breadcrumbs = {
          enable = false;
          navbuddy.enable = false;
        };
        smartcolumn = {
          enable = false;
        };
        fastaction.enable = true;
      };

      session = {
        nvim-session-manager.enable = false;
      };

      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
