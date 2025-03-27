{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    # font = {
    #   name = "JetBrainsMono Nerd Font Mono";
    #   size = 14;
    # };
    # extraConfig = ''
    #   include ${config.home.homeDirectory}/.cache/wal/colors-kitty.conf
    #   background_opacity 0.6
    #   enable_audio_bell no
    # '';
    shellIntegration = {
      mode = "no_rc";
      enableBashIntegration = true;
    };
  };
}
