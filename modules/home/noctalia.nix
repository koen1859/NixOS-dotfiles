{
  username,
  wallpaper,
  ...
}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        outerCorners = false;
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
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = true;
      };
      sessionMenu = {
        enableCountdown = false;
      };
      controlCenter = {
        position = "top_center";
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
      nightlight = {
        autoSchedule = true;
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      wallpaper = {
        enabled = true;
        defaultWallpaper = wallpaper;
        directory = "/home/${username}/.dotfiles/wallpapers";
        monitors = ["eDP-1" "DP-1" "DP-2" "HDMI-A-1"];
        useWallhaven = true;
      };
    };
  };
}
