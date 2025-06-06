{
  programs.nixvim = {
    keymaps = [
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
        key = "<leader>y";
        mode = ["n" "v"];
        options.silent = true;
        action = "\"+y";
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
        key = "<C-w>";
        mode = ["n"];
        options.silent = true;
        action = ":bdelete<CR>";
      }
      {
        key = "<Tab>";
        mode = ["n"];
        options.silent = true;
        action = ":bnext<CR>";
      }
      {
        key = "<S-Tab>";
        mode = ["n"];
        options.silent = true;
        action = ":bprevious<CR>";
      }
      {
        key = "J";
        mode = ["v"];
        options.silent = true;
        action = ":m '>+1<CR>gv=gv";
      }
      {
        key = "J";
        mode = ["n"];
        options.silent = true;
        action = "mzJ`z";
      }
      {
        key = "n";
        mode = ["n"];
        options.silent = true;
        action = "nzzzv";
      }
      {
        key = "N";
        mode = ["n"];
        options.silent = true;
        action = "Nzzzv";
      }
      {
        key = "<";
        mode = ["v"];
        options.silent = true;
        action = "<gv";
      }
      {
        key = ">";
        mode = ["v"];
        options.silent = true;
        action = ">gv";
      }
    ];
  };
}
