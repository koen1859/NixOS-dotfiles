{pkgs, ...}: {
  programs.nixvim = {
    keymaps = [
      {
        key = "<leader>ldt";
        mode = ["n"];
        options.silent = true;
        action = ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>";
      }
      {
        key = "gd";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>Trouble lsp_definitions<CR>";
      }
      {
        key = "gr";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>Trouble lsp_references<CR>";
      }
      {
        key = "gi";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>Trouble lsp_incoming_calls<CR>";
      }
    ];
    plugins = {
      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          ruff.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          bashls.enable = true;
          yamlls.enable = true;
          ltex.enable = true;
          texlab.enable = true;
          tinymist.enable = true;
          r_language_server = {
            enable = true;
            package = pkgs.rPackages.languageserver;
            autostart = true;
            cmd = ["R" "--slave" "-e" "languageserver::run()"];
            filetypes = ["r" "rmd"];
          };
          cssls.enable = true;
          phpactor.enable = true;
          clangd.enable = true;
          emmet_ls = {
            enable = true;
            filetypes = ["html" "php"];
          };
          lua_ls.enable = true;
        };
      };

      lsp-format = {
        enable = true;
      };

      lsp-status = {
        enable = true;
      };

      lspkind = {
        enable = true;
        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
          };
        };
      };

      lsp-lines = {
        enable = true;
      };

      lsp-signature = {
        enable = false;
      };

      colorful-menu = {
        enable = true;
      };

      lualine = {
        enable = true;
        settings.options.theme = "auto";
      };

      trouble = {
        enable = true;
        settings = {
          multiline = true;
        };
      };
    };
  };
}
