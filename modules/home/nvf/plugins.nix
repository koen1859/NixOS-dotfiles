{pkgs, ...}: {
  programs.nvf.settings.vim.startPlugins = with pkgs.vimPlugins; [
    vimtex
    undotree
    harpoon2
    lazygit-nvim
    ltex_extra-nvim
    compiler-nvim
    neoscroll-nvim
    smear-cursor-nvim
    csvview-nvim
  ];
}
