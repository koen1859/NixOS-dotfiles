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

      function _SEND_VISUAL_TO_TERMINAL()
        -- Exit visual mode to update marks
        local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
        vim.api.nvim_feedkeys(esc, "x", false)

        -- Get visual selection range
        local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(0, "<"))
        local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(0, ">"))
        local lines = vim.fn.getline(start_line, end_line)

        -- Build command string without blank lines and with consistent indent
        local cmd = ""
        local indent = nil
        for _, line in ipairs(lines) do
          if indent == nil and line:find("[^%s]") ~= nil then
            indent = line:find("[^%s]")
          end
          if not line:match("^%s*$") then
            cmd = cmd .. line:sub(indent or 1) .. string.char(13)
          end
        end

        -- Send to terminal
        require("toggleterm").exec(cmd, 1)
      end

      vim.keymap.set("v", "<Enter>", _SEND_VISUAL_TO_TERMINAL, { noremap = true, silent = true })

      local trim_spaces = false

      vim.keymap.set("n", "<Enter>", function()
        require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("j", true, false, true), "n", true)
      end)
    '';
  };
}
