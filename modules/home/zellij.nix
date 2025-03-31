_: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."zellij/config.kdl".text = ''
    show_startup_tips false
    keybinds {
        normal {
            bind "Alt n" { NewPane; }
            bind "Alt t" { NewTab; }
            bind "Alt h" { MoveFocusOrTab "Left"; }
            bind "Alt l" { MoveFocusOrTab "Right"; }
            bind "Alt j" { MoveFocusOrTab "Down"; }
            bind "Alt k" { MoveFocusOrTab "Up"; }
        }
    }
  '';
}
