{
  programs.nixvim.plugins = {
    aerial = {
      enable = false;
      settings = {
        attach_mode = "global";
        backends = [
          "treesitter"
          "lsp"
        ];
        highlight_on_hover = true;
      };
    };
  };
}
