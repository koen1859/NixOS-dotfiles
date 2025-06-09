{
  programs.nvf.settings.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      lspkind.enable = false;
      lightbulb.enable = false;
      lspsaga.enable = false;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = false;
      nvim-docs-view.enable = false;
    };

    diagnostics = {
      enable = true;
      config = {
        virtual_lines.enable = true;
        underline = true;
      };
    };

    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
      nix = {
        enable = true;
        lsp = {
          enable = true;
          server = "nixd";
        };
        format = {
          enable = true;
          type = "alejandra";
        };
      };
      python = {
        enable = true;
        lsp = {
          enable = true;
          server = "pyright";
        };
        format = {
          enable = true;
          type = "ruff";
        };
      };
      r.enable = true;
      markdown.enable = true;
      html.enable = true;
      lua.enable = true;
      css.enable = true;
      typst.enable = true;
    };
  };
}
