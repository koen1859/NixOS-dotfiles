{
  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
