{
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    autocomplete.nvim-cmp.enable = true;
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      lspkind.enable = true;
      lightbulb.enable = true;
      lspsaga.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      nvim-docs-view.enable = true;
      servers = {
        ltex_ls = {
          enable = true;
          cmd = [(lib.getExe pkgs.ltex-ls)];
          filetypes = ["tex"];
        };
        texlab = {
          enable = true;
          cmd = [(lib.getExe pkgs.texlab)];
          filetypes = ["tex"];
        };
        nixd = {
          enable = true;
          cmd = [(lib.getExe pkgs.nixd)];
          filetypes = ["nix"];
        };
        alejandra = {
          enable = true;
          cmd = [(lib.getExe pkgs.alejandra)];
          filetypes = ["nix"];
        };
      };
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
      php.enable = true;
      r.enable = true;
      markdown.enable = true;
      html.enable = true;
      lua.enable = true;
      css.enable = true;
      typst.enable = true;
    };
  };
}
