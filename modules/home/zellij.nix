_: {
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      keybinds = {
        normal = {
          "Alt n" = [{NewPane = {};}];
          "Alt t" = [{NewTab = {};}];
          "Alt h" = [{MoveFocusOrTab = "Left";}];
          "Alt l" = [{MoveFocusOrTab = "Right";}];
          "Alt j" = [{MoveFocusOrTab = "Down";}];
          "Alt k" = [{MoveFocusOrTab = "Up";}];
          "Alt Tab" = [{GoToNextTab = {};}];
          "Alt Shift Tab" = [{GoToPreviousTab = {};}];
        };
      };
    };
  };
}
