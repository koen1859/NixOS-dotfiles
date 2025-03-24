{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        sensitivity = 0.0;
      };
      bind = [
        "SUPER_SHIFT, S, exec, hyprshot -m output -m eDP-1"
      ];
    };
  };
}
