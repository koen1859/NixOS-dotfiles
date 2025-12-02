{wallpaper, ...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        widgets = {
          left = [
            {
              id = "ControlCenter";
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "ActiveWindow";
            }
            {
              id = "MediaMini";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
            }
          ];
          right = [
            {
              id = "PowerProfiles";
            }
            {
              id = "ScreenRecorder";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
            }
            {
              id = "Volume";
            }
            {
              id = "Brightness";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "WiFi";
            }
            {
              id = "Clock";
            }
          ];
        };
      };
      sessionMenu = {
        enableCountdown = false;
      };
      dock = {
        monitors = ["eDP-1" "DP-1" "DP-2" "HDMI-A-1"];
      };
      ui = {
        fontDefault = "Jetbrains Mono Nerd Font";
      };
      location = {
        name = "Groningen";
      };
      appLauncher = {
        enabled = true;
        terminalCommand = "foot";
      };
      colorSchemes.predefinedScheme = "Gruvbox";
      wallpaper = {
        enabled = true;
        defaultWallpaper = wallpaper;
        monitors = ["eDP-1" "DP-1" "DP-2" "HDMI-A-1"];
      };
    };
  };
}
