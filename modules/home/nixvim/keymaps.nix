{
  programs.nixvim = {
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
      {
        key = "<Up>";
        mode = ["n"];
        options.silent = true;
        action = ":resize -2<CR>";
      }
      {
        key = "<Down>";
        mode = ["n"];
        options.silent = true;
        action = ":resize +2<CR>";
      }
      {
        key = "<Left>";
        mode = ["n"];
        options.silent = true;
        action = ":vertical resize -2<CR>";
      }
      {
        key = "<Right>";
        mode = ["n"];
        options.silent = true;
        action = ":vertical resize +2<CR>";
      }
      {
        key = "<leader>ldt";
        mode = ["n"];
        options.silent = true;
        action = ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>";
      }
      {
        key = "<leader>y";
        mode = ["n" "v"];
        options.silent = true;
        action = "\"+y";
      }
      {
        key = "gd";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>Telescope lsp_definitions<CR>";
      }
      {
        key = "gr";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>Telescope lsp_references<CR>";
      }
      {
        key = "gi";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>Telescope lsp_implementations<CR>";
      }
      {
        mode = "n";
        key = "<leader>fe";
        options.silent = true;
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        key = "<leader>u";
        mode = ["n"];
        options.silent = true;
        action = ":UndotreeToggle<cr>";
      }
      {
        key = "<C-k>";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>wincmd k<cr>";
      }
      {
        key = "<C-j>";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>wincmd j<cr>";
      }
      {
        key = "<C-h>";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>wincmd h<cr>";
      }
      {
        key = "<C-l>";
        mode = ["n"];
        options.silent = true;
        action = "<cmd>wincmd l<cr>";
      }
      {
        key = "<leader>nh";
        mode = ["n"];
        options.silent = true;
        action = ":nohl<CR>";
      }
      {
        key = "<C-q>";
        mode = ["n"];
        options.silent = true;
        action = ":bdelete!<CR>";
      }
    ];
  };
}
