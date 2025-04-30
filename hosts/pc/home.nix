_: {
  wayland.windowManager.hyprland = {
    extraConfig = ''
      workspace = 1, monitor:DP-1
      workspace = 2, monitor:DP-1
      workspace = 3, monitor:DP-1
      workspace = 4, monitor:DP-1
      workspace = 5, monitor:DP-1
      workspace = 6, monitor:HDMI-A-1
      workspace = 7, monitor:HDMI-A-1
      workspace = 8, monitor:HDMI-A-1
      workspace = 9, monitor:HDMI-A-1
      workspace = 10, monitor:HDMI-A-1
    '';
    settings = {
      input = {
        sensitivity = -1.0;
      };
    };
  };
}
