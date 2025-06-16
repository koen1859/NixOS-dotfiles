{
  lib,
  pkgs,
  ...
}: {
  vim = {
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
          cmd = [(lib.getExe pkgs.pyright) "--stdio"];
          filetypes = ["python"];
        };
        ruff = {
          enable = true;
          cmd = [(lib.getExe pkgs.ruff) "server"];
          filetypes = ["python"];
        };
        r_language_server = {
          enable = true;
          cmd = [
            "${(pkgs.rWrapper.override {
              packages = with pkgs.rPackages; [languageserver];
            })}/bin/R"
            "--slave"
            "-e"
            "languageserver::run()"
          ];
          filetypes = ["r" "rmd"];
        };
        tinymist = {
          enable = true;
          cmd = [(lib.getExe pkgs.tinymist) "lsp"];
          filetypes = ["typst"];
        };
        phpactor = {
          enable = true;
          cmd = [(lib.getExe pkgs.phpactor) "language-server"];
          filetypes = ["php"];
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
      nix = {
        enable = true;
        lsp.enable = false;
        format = {
          enable = true;
          type = "alejandra";
        };
      };
      python = {
        enable = true;
        lsp.enable = false;
        format = {
          enable = false;
          type = "ruff";
        };
      };
      r = {
        enable = true;
        lsp.enable = false;
        format = {
          enable = true;
          type = "styler";
        };
      };
      php = {
        enable = true;
        lsp.enable = false;
      };
      html.enable = true;
      lua.enable = true;
      css.enable = true;
      typst = {
        enable = true;
        lsp.enable = false;
      };
    };
  };
}
