{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      mode = "no_rc";
      enableBashIntegration = true;
    };
  };
}
