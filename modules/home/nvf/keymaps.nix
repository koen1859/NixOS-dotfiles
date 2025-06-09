{
  programs.nvf.settings.vim = {
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
        key = "<leader>y";
        mode = ["n" "v"];
        action = "\"+y";
      }
      {
        key = "<C-k>";
        mode = ["n"];
        action = "<cmd>wincmd k<cr>";
      }
      {
        key = "<C-j>";
        mode = ["n"];
        action = "<cmd>wincmd j<cr>";
      }
      {
        key = "<C-h>";
        mode = ["n"];
        action = "<cmd>wincmd h<cr>";
      }
      {
        key = "<C-l>";
        mode = ["n"];
        action = "<cmd>wincmd l<cr>";
      }
      {
        key = "<leader>nh";
        mode = ["n"];
        action = ":nohl<CR>";
      }
      {
        key = "<C-w>";
        mode = ["n"];
        action = ":bdelete<CR>";
      }
      {
        key = "<Tab>";
        mode = ["n"];
        action = ":bnext<CR>";
      }
      {
        key = "<S-Tab>";
        mode = ["n"];
        action = ":bprevious<CR>";
      }
      {
        key = "J";
        mode = ["v"];
        action = ":m '>+1<CR>gv=gv";
      }
      {
        key = "J";
        mode = ["n"];
        action = "mzJ`z";
      }
      {
        key = "n";
        mode = ["n"];
        action = "nzzzv";
      }
      {
        key = "N";
        mode = ["n"];
        action = "Nzzzv";
      }
      {
        key = "<";
        mode = ["v"];
        action = "<gv";
      }
      {
        key = ">";
        mode = ["v"];
        action = ">gv";
      }
      {
        key = "<leader>u";
        mode = ["n"];
        action = ":UndotreeToggle<cr>";
      }
      {
        mode = "n";
        key = "<leader>fe";
        action = "<cmd>:Neotree toggle<CR>";
      }
      {
        mode = "n";
        key = "-";
        action = "<cmd>:Oil<CR>";
      }
      {
        mode = "n";
        key = "<leader>a";
        action = "<cmd> lua require'harpoon':list():add()<CR>";
      }
      {
        mode = "n";
        key = "<C-e>";
        action = "<cmd>lua require'harpoon'.ui:toggle_quick_menu(require'harpoon':list())<CR>";
      }
      {
        mode = "n";
        key = "<C-1>";
        action = "<cmd>lua require'harpoon':list():select(1)<CR>";
      }
      {
        mode = "n";
        key = "<C-2>";
        action = "<cmd>lua require'harpoon':list():select(2)<CR>";
      }
      {
        mode = "n";
        key = "<C-3>";
        action = "<cmd>lua require'harpoon':list():select(3)<CR>";
      }
      {
        mode = "n";
        key = "<C-4>";
        action = "<cmd>lua require'harpoon':list():select(4)<CR>";
      }
      {
        mode = "n";
        key = "<leader><Tab>";
        action = "<cmd>lua require'harpoon':list():next()<CR>";
      }
      {
        mode = "n";
        key = "<leader><S-Tab>";
        action = "<cmd>lua require'harpoon':list():prev()<CR>";
      }
      {
        key = "<leader>ldt";
        mode = ["n"];
        action = ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>";
      }
      {
        key = "gd";
        mode = ["n"];
        action = "<cmd>Trouble lsp_definitions<CR>";
      }
      {
        key = "gr";
        mode = ["n"];
        action = "<cmd>Trouble lsp_references<CR>";
      }
      {
        key = "gi";
        mode = ["n"];
        action = "<cmd>Trouble lsp_incoming_calls<CR>";
      }
    ];
  };
}
