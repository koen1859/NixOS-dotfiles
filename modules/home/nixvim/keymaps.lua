{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>fe";
        options.silent = true;
        action = "<cmd>Neotree<CR>";
      }
    ];
  };
}
