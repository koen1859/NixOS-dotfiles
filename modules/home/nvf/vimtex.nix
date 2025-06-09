{pkgs, ...}: {
  programs.nvf.config.vim.extraPlugins = {
    vimtex = {
      package = pkgs.vimPlugins.vimtex;
    };
  };
}
