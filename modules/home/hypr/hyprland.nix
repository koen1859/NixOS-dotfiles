{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "waybar"
      ];
      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
      };
      gestures = {
        workspace_swipe = false;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 2;
        border_size = 2;
        resize_on_border = false;
        allow_tearing = false;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      decoration = {
        rounding = 5;
        active_opacity = 0.8;
        inactive_opacity = 0.6;
        shadow = {
          enabled = true;
          ignore_window = true;
          range = 20;
          offset = "0 2";
          render_power = 4;
        };
        blur = {
          enabled = true;
          xray = true;
          special = false;
          new_optimizations = true;
          size = 2;
          passes = 2;
          # vibrancy = 0.1696;
          brightness = 1;
          noise = 0.01;
          popups = true;
          popups_ignorealpha = 0.6;
        };
      };
      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        "EDITOR,nvim"
        # "XCURSOR_SIZE,24"
        # "XCURSOR_THEME,Bibata-Modern-Classic"
        # "HYPRCURSOR_SIZE,24"
        # "HYPRCURSOR_THEME,Bibata-Modern-Classic"
        "HYPRSHOT_DIR,/home/koenstevens/Pictures/"
      ];
    };
    extraConfig = "
      monitor=,preferred,auto,1.25
      ";
  };
}
