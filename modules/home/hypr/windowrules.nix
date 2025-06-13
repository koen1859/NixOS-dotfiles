{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 1.00 0.70,class:^(kitty)"
        "opacity 1.00 0.70,class:&(org.wezfurlong.wezterm)"
      ];
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
