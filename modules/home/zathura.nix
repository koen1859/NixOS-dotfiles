{
  config,
  lib,
  ...
}: {
  programs.zathura = {
    enable = true;
    options = lib.mkForce {
      default-bg = "#${config.lib.stylix.colors.base00}";
      default-fg = "#${config.lib.stylix.colors.base0D}";
      inputbar-bg = "#${config.lib.stylix.colors.base00}";
      inputbar-fg = "#${config.lib.stylix.colors.base0D}";
      statusbar-bg = "#${config.lib.stylix.colors.base00}";
      statusbar-fg = "#${config.lib.stylix.colors.base0D}";
      notification-bg = "#${config.lib.stylix.colors.base00}";
      notification-fg = "#${config.lib.stylix.colors.base0D}";
      highlight-active-color = "#${config.lib.stylix.colors.base06}50";
      highlight-color = "#${config.lib.stylix.colors.base04}50";
      recolor = true;
      recolor-lightcolor = "#${config.lib.stylix.colors.base00}";
      recolor-darkcolor = "#${config.lib.stylix.colors.base0D}";
      selection-clipboard = "clipboard";
    };
  };
}
