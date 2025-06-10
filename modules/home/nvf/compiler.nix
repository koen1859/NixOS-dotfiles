{pkgs, ...}: {
  config.vim.lazy.plugins = {
    compiler = {
      package = pkgs.vimPlugins.compiler-nvim;
      setupModule = "compiler";
    };
  };
}
