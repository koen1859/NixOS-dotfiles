{ config, lib, pkgs, ... }:

{
  wayland.windowManageer.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}
