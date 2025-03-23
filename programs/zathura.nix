{ config, lib, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#${config.lib.stylix.colors.base00}";
      default-fg = "#${config.lib.stylix.colors.base07}";
      inputbar-bg = "#${config.lib.stylix.colors.base00}";
      inputbar-fg = "#${config.lib.stylix.colors.base07}";
      statusbar-bg = "#${config.lib.stylix.colors.base00}";
      statusbar-fg = "#${config.lib.stylix.colors.base07}";
      notification-bg = "#${config.lib.stylix.colors.base00}";
      notification-fg = "#${config.lib.stylix.colors.base07}";
      highlight-active-color = "#${config.lib.stylix.colors.base06}50";
      highlight-color = "#${config.lib.stylix.colors.base04}50";
      recolor = true;
      recolor-lightcolor = "#${config.lib.stylix.colors.base00}";
      recolor-darkcolor = "#${config.lib.stylix.colors.base07}";
      selection-clipboard = "clipboard";
    };
  };
}
