{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    extraConfigLua = ''
            local Terminal = require("toggleterm.terminal").Terminal

      local ipython = Terminal:new({
        cmd = "ipython",
        hidden = true,
        direction = "float", -- or "horizontal" / "vertical"
      })

      function _IPYTHON_TOGGLE()
        ipython:toggle()
      end
    '';
  };
}
