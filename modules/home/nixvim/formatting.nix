{
  programs.nixvim.plugins = {
    none-ls = {
      enable = true;
      settings = {
        cmd = ["bash -c nvim"];
        debug = true;
      };
      sources = {
        code_actions = {
          statix.enable = true;
          gitsigns.enable = true;
        };
        diagnostics = {
          statix.enable = true;
          deadnix.enable = true;
          checkstyle.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          shfmt.enable = true;
          prettier.enable = true;
          phpcbf.enable = true;
        };
        completion = {
          luasnip.enable = true;
        };
      };
    };

    lint = {
      enable = true;
      lintersByFt = {
        text = ["vale"];
        json = ["jsonlint"];
        markdown = ["vale"];
      };
    };

    tailwind-tools = {
      enable = true;
    };
  };
}
