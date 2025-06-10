{config, ...}: {
  programs.nvf.settings.vim = {
    dashboard.startify = {
      enable = true;
      customHeader = [
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗"
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║"
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║"
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║"
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║"
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝"
      ];
      commands = [
        {ff = "Telescope fd";}
        {fg = "Telescope live_grep";}
        {fe = "Oil";}
        {g = "LazyGit";}
      ];
      lists = [
        {type = "commands";}
        {type = "dir";}
      ];
      skipList = [
        "flake.lock"
      ];
    };
    filetree.neo-tree.enable = true;
    notify = {
      nvim-notify.enable = true;
      nvim-notify.setupOpts.background_colour = "#${config.lib.stylix.colors.base01}";
    };
    tabline.nvimBufferline.enable = true;
    treesitter.context.enable = true;
    statusline.lualine = {
      enable = true;
      theme = "base16";
    };

    telescope.enable = true;
    visuals = {
      nvim-web-devicons.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      indent-blankline.enable = true;
      rainbow-delimiters.enable = true;
    };
    ui = {
      noice.enable = true;
      colorizer.enable = true;
      illuminate.enable = true;
      breadcrumbs = {
        enable = false;
        navbuddy.enable = false;
      };
      smartcolumn = {
        enable = true;
      };
      fastaction.enable = true;
    };
  };
}
