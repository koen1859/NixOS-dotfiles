_: {
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "suppressevent maximize, class:.*"
        # "opacity 1.00 0.70,class:^(kitty)"
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
