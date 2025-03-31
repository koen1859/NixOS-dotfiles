{pkgs, ...}: {
  config.vim.extraPlugins = with pkgs.vimPlugins; {
    zellij-nav = {
      package = zellij-nav-nvim;
      setup = "require('zellij-nav').setup {}";
    };
  };
}
