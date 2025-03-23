{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    settings.input = {
      sensitivity = 0.0;
    };
  };
}
