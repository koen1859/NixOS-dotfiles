{
  programs.nixvim = {
    keymaps = [
      {
        key = "<Up>";
        mode = ["n"];
        action = ":resize -2<CR>";
      }
      {
        key = "<Down>";
        mode = ["n"];
        action = ":resize +2<CR>";
      }
      {
        key = "<Left>";
        mode = ["n"];
        action = ":vertical resize -2<CR>";
      }
      {
        key = "<Right>";
        mode = ["n"];
        action = ":vertical resize +2<CR>";
      }
      {
        key = "<leader>ldt";
        mode = ["n"];
        action = ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>";
      }
      {
        key = "<leader><C-c>";
        mode = ["n"];
        options.silent = true;
        action = ":w<CR>:!ls % | entr -n bash ~/.dotfiles/modules/home/nixvim/build-pandoc-simple.sh % &<CR>";
      }
      {
        key = "<leader>c";
        mode = ["n"];
        options.silent = true;
        action = ":w<CR>:!ls % | entr -n bash ~/.dotfiles/modules/home/nixvim/build-pandoc.sh % &<CR>";
      }
      {
        key = "<leader><S-y>";
        mode = ["n" "v"];
        action = "\"+Y";
      }
      {
        key = "<leader>y";
        mode = ["n" "v"];
        action = "\"+y";
      }
      {
        key = "gd";
        mode = ["n"];
        action = "<cmd>Telescope lsp_definitions<CR>";
      }
      {
        key = "gr";
        mode = ["n"];
        action = "<cmd>Telescope lsp_references<CR>";
      }
      {
        key = "gi";
        mode = ["n"];
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
        action = ":UndotreeToggle<cr>";
      }
      {
        key = "<C-k>";
        mode = ["n"];
        action = "<cmd>ZellijNavigateUp<cr>";
      }
      {
        key = "<C-j>";
        mode = ["n"];
        action = "<cmd>ZellijNavigateDown<cr>";
      }
      {
        key = "<C-h>";
        mode = ["n"];
        action = "<cmd>ZellijNavigateLeft<cr>";
      }
      {
        key = "<C-l>";
        mode = ["n"];
        action = "<cmd>ZellijNavigateRight<cr>";
      }
      {
        key = "<leader>nh";
        mode = ["n"];
        action = ":nohl<CR>";
      }
      {
        key = "<C-q>";
        mode = ["n"];
        action = ":bdelete!<CR>";
      }
    ];
  };
}
