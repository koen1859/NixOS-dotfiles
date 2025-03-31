{pkgs, ...}: {
  config.vim.extraPlugins = with pkgs.vimPlugins; {
    package = zellij-nav-nvim;
    setup = "require(" zellij-nav ").setup {}";
  };
}
