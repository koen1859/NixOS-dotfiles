{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>fe";
        options.silent = true;
        action = "<cmd>Neotree toggle<CR>";
      }
      {
        key = "<leader>u";
        mode = [ "n" ];
        action = ":UndotreeToggle<cr>";
      }
      {
        key = "<C-k>";
        mode = [ "n" ];
        action = "<cmd>ZellijNavigateUp<cr>";
      }
      {
        key = "<C-j>";
        mode = [ "n" ];
        action = "<cmd>ZellijNavigateDown<cr>";
      }
      {
        key = "<C-h>";
        mode = [ "n" ];
        action = "<cmd>ZellijNavigateLeft<cr>";
      }
      {
        key = "<C-l>";
        mode = [ "n" ];
        action = "<cmd>ZellijNavigateRight<cr>";
      }
      {
        key = "<leader>nh";
        mode = [ "n" ];
        action = ":nohl<CR>";
      }
      {
        key = "<C-q>";
        mode = [ "n" ];
        action = ":bdelete!<CR>";
      }
    ];
  };
}
