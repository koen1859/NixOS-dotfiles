{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    luaConfig.post = ''
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

      local Terminal = require("toggleterm.terminal").Terminal

      local ipython = Terminal:new({
        cmd = "ipython --no-autoindent",
        direction = "horizontal",
      })
      local python = Terminal:new({
        cmd = "python",
        direction = "horizontal",
      })
      local r = Terminal:new({
        cmd = "R",
        direction = "horizontal",
      })

      function _IPYTHON_TOGGLE()
        ipython:toggle()
      end
      function _PYTHON_TOGGLE()
        python:toggle()
      end
      function _R_TOGGLE()
        r:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>ti", "<cmd>lua _IPYTHON_TOGGLE()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>lua _R_TOGGLE()<CR>", { noremap = true, silent = true })

      local trim_spaces = false
      vim.keymap.set("v", "<Enter>", function()
          require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
      end)

      vim.keymap.set("n", "<Enter>", function()
          require("toggleterm").send_lines_to_terminal("single_line", false, { args = vim.v.count })
      end)
    '';
  };
}
