{ config, lib, pkgs, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      default-bg = "#${config.lib.stylix.colors.base05}";
    };
  };
}
