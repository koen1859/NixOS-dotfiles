_: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "opacity 0.90 0.70,class:^(firefox)"
        "opacity 0.90 0.70,class:^(brave-browser)$"
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
