{ config, lib, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#${config.lib.stylix.colors.base00}";
      default-fg = "#${config.lib.stylix.colors.base00}";
      recolor = true;
      recolor-lightcolor = "#${config.lib.stylix.colors.base00}";
      recolor-darkcolor = "#${config.lib.stylix.colors.base07}";
    };
  };
}
