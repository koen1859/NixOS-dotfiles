{
  lib,
  pkgs,
  ...
}: {
  programs.nvf.settings.vim = {
    snippets.luasnip.enable = true;
    autocomplete.nvim-cmp.enable = true;
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
      lspkind.enable = true;
      lspSignature.enable = true;
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
        pyright = {
          enable = true;
          cmd = ["${pkgs.pyright}/bin/pyright-langserver" "--stdio"];
          filetypes = ["python"];
        };
        ruff = {
          enable = true;
          cmd = [(lib.getExe pkgs.ruff) "server"];
          filetypes = ["python"];
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
          enable = false;
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
          enable = false;
          server = "pyright";
        };
        format = {
          enable = false;
          type = "ruff";
        };
      };
      r.enable = true;
      php.enable = true;
      html.enable = true;
      lua.enable = true;
      css.enable = true;
    };
  };
}
