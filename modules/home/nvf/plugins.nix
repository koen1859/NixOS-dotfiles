{pkgs, ...}: {
  programs.nvf.settings.vim.startPlugins = with pkgs.vimPlugins; [
    vimtex
    undotree
  ];
}
