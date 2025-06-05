{
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>u";
        mode = ["n"];
        options.silent = true;
        action = ":UndotreeToggle<cr>";
      }
      {
        mode = "n";
        key = "<leader>fe";
        options.silent = true;
        action = "<cmd>:Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "-";
        options.silent = true;
        action = "<cmd>:Oil<CR>";
      }
      {
        mode = "n";
        key = "<leader>a";
        action = "<cmd> lua require'harpoon':list():add()<CR>";
      }
      {
        mode = "n";
        key = "<C-e>";
        action = "<cmd>lua require'harpoon'.ui:toggle_quick_menu(require'harpoon':list())<CR>";
      }
      {
        mode = "n";
        key = "<C-1>";
        action = "<cmd>lua require'harpoon':list():select(1)<CR>";
      }
      {
        mode = "n";
        key = "<C-2>";
        action = "<cmd>lua require'harpoon':list():select(2)<CR>";
      }
      {
        mode = "n";
        key = "<C-3>";
        action = "<cmd>lua require'harpoon':list():select(3)<CR>";
      }
      {
        mode = "n";
        key = "<C-4>";
        action = "<cmd>lua require'harpoon':list():select(4)<CR>";
      }
      {
        mode = "n";
        key = "<leader><Tab>";
        action = "<cmd>lua require'harpoon':list():next()<CR>";
      }
      {
        mode = "n";
        key = "<leader><S-Tab>";
        action = "<cmd>lua require'harpoon':list():prev()<CR>";
      }
    ];
    plugins = {
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
      neoscroll.enable = true;
      smear-cursor.enable = true;
      csvview.enable = true;
      lazygit.enable = true;
      noice.enable = true;
      oil.enable = true;
      web-devicons.enable = true;
      which-key.enable = true;

      startify = {
        enable = true;
        settings = {
          custom_header = [
            ""
            "     ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "     ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "     ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "     ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "     ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "     ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];

          commands = [
            {ff = "Telescope fd";}
            {fg = "Telescope live_grep";}
            {fe = "Oil";}
            {g = "LazyGit";}
          ];
          change_to_dir = false;
          use_unicode = true;
          lists = [
            {type = "commands";}
            {type = "dir";}
          ];
          files_number = 5;
          autoExpandWidth = true;
          skiplist = [
            "flake.lock"
          ];
        };
      };

      treesitter-context.enable = true;

      neo-tree = {
        enable = true;
        enableGitStatus = true;
        enableModifiedMarkers = true;
        enableRefreshOnWrite = true;
        closeIfLastWindow = true;
        buffers = {
          bindToCwd = false;
          followCurrentFile = {
            enabled = true;
          };
        };
        filesystem = {
          filteredItems = {
            hideDotfiles = false;
            alwaysShow = [
              "node_modules"
              "dist"
              "'[A-Z]*'"
            ];
            visible = true;
          };
        };
      };

      undotree = {
        enable = true;
        settings = {
          autoOpenDiff = true;
          focusOnToggle = true;
        };
      };

      notify = {
        enable = false;
      };

      transparent = {
        enable = true;
        settings = {
          groups = [
            "Normal"
            "NormalNC"
            "Comment"
            "Constant"
            "Special"
            "Identifier"
            "Statement"
            "PreProc"
            "Type"
            "Underlined"
            "Todo"
            "String"
            "Function"
            "Conditional"
            "Repeat"
            "Operator"
            "Structure"
            "LineNr"
            "NonText"
            "SignColumn"
            "CursorLine"
            "CursorLineNr"
            "StatusLine"
            "StatusLineNC"
            "EndOfBuffer"
          ];
        };
      };
    };
  };
}
