{
  imports = [
    ./keymaps.nix
    ./lsp.nix
    ./ui.nix
    ./vimtex.nix
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

      autopairs.nvim-autopairs.enable = true;
      snippets.luasnip.enable = true;
      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };
      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
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
