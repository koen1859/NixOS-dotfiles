{
  programs.nixvim = {
    plugins = {
      nvim-surround.enable = true;
      nvim-autopairs.enable = true;
      treesj.enable = true;
      auto-save.enable = true;
      compiler.enable = true;
      csvview.enable = true;
      emmet.enable = true;
      guess-indent.enable = true;
      jupytext.enable = true;
      lazygit.enable = true;
      overseer.enable = true;
      wezterm.enable = true;
      dropbar.enable = true;
      typst-vim.enable = true;
      typst-preview.enable = true;
      yazi.enable = true;
      zen-mode.enable = true;
    };
    keymaps = [
      {
        key = "<leader>g";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>LazyGit<cr>";
      }
      {
        key = "<leader>a";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>AerialToggle!<cr>";
      }
      {
        key = "<C-Enter>";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>CompilerOpen<cr>";
      }
      {
        key = "<leader><BS>";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>CompilerToggleResults<cr>";
      }
      {
        key = "<leader>r";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>CompilerRedo<cr>";
      }
    ];
  };
}
