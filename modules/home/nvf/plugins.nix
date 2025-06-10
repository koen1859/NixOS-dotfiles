{pkgs, ...}: {
  programs.nvf = {
    settings.vim = {
      startPlugins = with pkgs.vimPlugins; [
        vimtex
        undotree
        harpoon2
        lazygit-nvim
        ltex_extra-nvim
        csvview-nvim
      ];
      extraPlugins = {
        compiler = {
          package = pkgs.vimPlugins.compiler-nvim;
          setup = "require('compiler').setup {}";
        };
        csvview = {
          package = pkgs.vimPlugins.csvview-nvim;
          setup = "require('csvview').setup {}";
        };
      };
    };
  };
}
