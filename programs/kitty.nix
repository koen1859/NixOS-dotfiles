{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name ="CaskaydiaCove Nerd Font Mono";
      size = 14;
    };
    extraConfig = ''
      include ${config.home.homeDirectory}/.cache/wal/colors-kitty.conf
      background_opacity 0.8
    '';
    keybindings = {
      "ctrl+shift+enter" = "no_op";
      "shift+enter" = "send_text all \x1b[13;2u";
      "ctrl+enter" = "send_text all \x1b[13;5u";
      "ctrl+f" = "launch --type=overlay fzf";
    };
    shellIntegration = {
      mode = "no_rc";
      enableBashIntegration = true;
    };
  };
}
