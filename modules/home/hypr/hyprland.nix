{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = false;
    package = pkgs.hyprland;
    xwayland.enable = true;
    settings = {
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.hyprpaper}/bin/hyprpaper"
      ];
      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
        };
        repeat_rate = 35;
        repeat_delay = 200;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      general = {
        "$mainMod" = "SUPER";
        layout = "master";
        gaps_in = 5;
        gaps_out = 5;
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
        new_on_top = true;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      decoration = {
        rounding = 5;
        active_opacity = 1.0;
        inactive_opacity = 0.7;
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
          size = 8;
          passes = 2;
          # vibrancy = 0.1696;
          brightness = 1;
          noise = 0.01;
          popups = true;
          popups_ignorealpha = 0.6;
        };
      };
    };
    extraConfig = ''
      monitor=DP-2,3440x1440@180,0x0,1
      monitor=DP-1,3440x1440@60,3440x0,1
      monitor=eDP-1,1920x1080@60,0x0,1.25
    '';
    plugins = with pkgs.hyprlandPlugins; [
    ];
  };
}
