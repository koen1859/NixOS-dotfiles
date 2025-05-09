{pkgs, ...}: {
  programs.nixvim.plugins = {
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
}
