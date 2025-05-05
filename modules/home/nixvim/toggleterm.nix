{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    luaConfig.post = ''
      local Terminal = require("toggleterm.terminal").Terminal

      local ipython = Terminal:new({
        cmd = "python",
        direction = "horizontal",
      })

      function _IPYTHON_TOGGLE()
        ipython:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>ti", "<cmd>lua _IPYTHON_TOGGLE()<CR>", { noremap = true, silent = true })
    '';
  };
}
