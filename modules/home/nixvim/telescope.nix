{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        fzf-native = {
          enable = true;
          settings = {
            case_mode = "smart_case";
            fuzzy = false;
            override_file_sorter = true;
            override_generic_sorter = true;
          };
        };
        media-files = {
          enable = true;
          settings = {
            filetypes = [
              "png"
              "jpg"
              "jpeg"
              "webp"
              "gif"
            ];
            find_cmd = "rg";
          };
        };
      };
      keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>b" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fd" = "diagnostics";
        "<leader>mf" = "media_files";

        # FZF like bindings
        "<C-p>" = "git_files";
        "<leader>p" = "oldfiles";
        "<C-f>" = "live_grep";
      };
      settings.pickers = {
        find_files = {
          find_command = [
            "fd"
            "--type"
            "f"
            "--strip-cwd-prefix"
            "--hidden"
            "--exclude"
            ".git"
          ];
        };
      };

      settings.defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        set_env.COLORTERM = "truecolor";
      };
    };
  };
}
