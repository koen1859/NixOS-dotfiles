{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "CaskaydiaCove Nerd Font Mono";
      size = 14;
    };
    extraConfig = ''
      include ${config.home.homeDirectory}/.cache/wal/colors-kitty.conf
      background_opacity 0.8
    '';
    shellIntegration = {
      mode = "no_rc";
      enableBashIntegration = true;
    };
  };
}
