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
    ];
    plugins = {
      noice.enable = true;
      oil = {
        enable = true;
      };
      web-devicons = {
        enable = true;
      };

      which-key = {
        enable = true;
      };

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

          change_to_dir = false;
          use_unicode = true;
          lists = [{type = "dir";}];
          files_number = 30;
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
        enable = true;
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
