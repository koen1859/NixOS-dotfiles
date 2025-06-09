{config, ...}: {
  imports = [
    ./keymaps.nix
    ./lsp.nix
    ./ui.nix
  ];
  programs.nvf = {
    enable = true;

    settings.vim = {
      lsp.enable = true;
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      lineNumberMode = "relNumber";
      enableLuaLoader = true;
      preventJunkFiles = true;
      options = {
        tabstop = 4;
        shiftwidth = 2;
        wrap = false;
      };

      clipboard = {
        enable = true;
        registers = "unnamed";
      };

      spellcheck = {
        enable = true;
        languages = ["en"];
        programmingWordlist.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "base16";
      };

      autopairs.nvim-autopairs.enable = true;
      snippets.luasnip.enable = true;
      tabline.nvimBufferline.enable = true;
      treesitter.context.enable = false;
      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
      };
      projects.project-nvim.enable = true;
      dashboard.dashboard-nvim.enable = true;
      filetree.neo-tree.enable = true;
      notify = {
        nvim-notify.enable = true;
        nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
      };
      utility = {
        oil-nvim.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        images = {
          image-nvim.enable = false;
        };
      };
      session = {
        nvim-session-manager.enable = false;
      };
      comments = {
        comment-nvim.enable = true;
      };
    };
  };
}
