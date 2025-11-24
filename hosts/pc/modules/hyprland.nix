{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        sensitivity = -1.0;
      };
    };
    extraConfig = ''
      workspace=1,monitor:DP-2
      workspace=2,monitor:DP-2
      workspace=3,monitor:DP-2
      workspace=4,monitor:DP-2
      workspace=5,monitor:DP-2

      workspace=6,monitor:DP-1,
      workspace=7,monitor:DP-1,
      workspace=8,monitor:DP-1,
      workspace=9,monitor:DP-1,
      workspace=10,monitor:DP-1,
    '';
  };
}
