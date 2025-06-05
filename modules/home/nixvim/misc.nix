{
  programs.nixvim = {
    plugins = {
      nvim-surround.enable = true;
      nvim-autopairs.enable = true;
      auto-save.enable = true;
      emmet.enable = true;
      compiler.enable = true;
      guess-indent.enable = true;
      jupytext.enable = true;
      typst-vim.enable = true;
      typst-preview.enable = true;
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
