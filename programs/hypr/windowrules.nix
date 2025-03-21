{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 0.90 0.70,class:^(firefox)"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(discord)$ #Discord-Electron"
        "opacity 0.80 0.70,class:^(pavucontrol)$"
        "opacity 0.80 0.70,class:^(blueman-manager)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.90 0.70,class:^(brave-browser)$"
        "opacity 0.80 0.70,class:^(thunar)$"
        "opacity 0.90 0.70,class:^(Code)$"
        "opacity 0.80 0.70,class:^(wasistlos)$"
        "opacity 0.80 0.70,class:^(RStudio)$"
        "opacity 0.90 0.70,class:^(brave-browser)$"
        "opacity 0.80 0.70,class:^(code)$"
        "opacity 0.80 0.70,class:^(org.pwmt.zathura)$"
        "opacity 0.80 0.60,class:^(com.mitchellh.ghostty)$"
      ];
      layerrule = [
        "blur, wofi"
        "ignorezero, wofi"
        "ignorealpha 0.5, wofi"
      ];
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
