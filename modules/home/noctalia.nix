{wallpaper, ...}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "top";
        showCapsule = false;
        widgets = {
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
            }
          ];
        };
      };
      ui = {
        fontDefault = "Jetbrains Mono Nerd Font";
      };
      location = {
        name = "Groningen";
      };
      appLauncher = {
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
