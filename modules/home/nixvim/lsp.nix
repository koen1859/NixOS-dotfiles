{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        cssls.enable = true; # CSS
        html.enable = true; # HTML
        pyright.enable = true; # Python
        marksman.enable = true; # Markdown
        nil_ls.enable = true; # Nix
        bashls.enable = true; # Bash
        yamlls.enable = true; # YAML
        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
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
          buffer = "[buffer]";
          neorg = "[neorg]";
        };
      };
    };

    lualine = {
      enable = true;
    };

    trouble = {
      enable = true;
      settings = {
        multiline = true;
      };
    };
  };
}
