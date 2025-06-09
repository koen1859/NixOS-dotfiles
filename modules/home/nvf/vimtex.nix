{pkgs, ...}: {
  programs.nvf.settings.vim.startPlugins = [pkgs.vimPlugins.vimtex];
}
