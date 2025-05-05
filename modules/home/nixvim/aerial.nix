{
  programs.nixvim.plugins = {
    aerial = {
      enable = true;
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
