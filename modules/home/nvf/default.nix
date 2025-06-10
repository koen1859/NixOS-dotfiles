{
  imports = [
    ./keymaps.nix
    ./lsp.nix
    ./ui.nix
    ./plugins.nix
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
        updatetime = 100;
        scrolloff = 10;
        undofile = true;
        incsearch = true;
        ignorecase = true;
        smartcase = true;
      };
      globals.maplocalleader = "\\";

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
      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };
      git.enable = true;
      utility = {
        oil-nvim.enable = true;
        surround.enable = true;
        diffview-nvim.enable = true;
        images = {
          image-nvim.enable = false;
        };
      };
    };
  };
}
