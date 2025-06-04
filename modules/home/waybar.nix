{
  pkgs,
  lib,
  config,
  ...
}: let
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in
  with lib; {
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = [
        {
          layer = "top";
          position = "top";
          modules-center = ["hyprland/workspaces"];
          modules-left = [
            "hyprland/window"
            "pulseaudio"
            "cpu"
            "memory"
            "disk"
            "network"
          ];
          modules-right = [
            "custom/notification"
            "custom/exit"
            "battery"
            "clock"
          ];

          "hyprland/workspaces" = {
            format = "{name}";
            format-icons = {
              default = " ";
              active = " ";
              urgent = " ";
            };
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "clock" = {
            format = '' {:L%H:%M}'';
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
          };
          "hyprland/window" = {
            max-length = 40;
            separate-outputs = false;
            rewrite = {
              "" = " 🙈 No Windows? ";
            };
          };
          "memory" = {
            interval = 5;
            format = " {}%";
            tooltip = true;
          };
          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
            tooltip = true;
          };
          "disk" = {
            format = " {free}";
            tooltip = true;
          };
          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = " {bandwidthDownOctets}";
            format-wifi = "{icon} {signalStrength}%";
            format-disconnected = "󰤮";
            tooltip = false;
            on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
          };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && ${pkgs.pavucontrol}/bin/pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && ${pkgs.wlogout}/bin/wlogout";
          };
          "custom/startmenu" = {
            tooltip = false;
            format = "";
            on-click = "${pkgs.rofi-wayland}/bin/rofi -show drun";
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} {}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "sleep 0.1 && ${pkgs.swaynotificationcenter}/bin/swaync-client -op";
            escape = true;
          };
          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            on-click = "";
            tooltip = false;
          };
        }
      ];
      style = concatStrings [
        ''
               * {
                 font-family: JetBrainsMono Nerd Font Mono;
                 font-size: 10px;
                 border-radius: 0px;
                 border: none;
                 min-height: 2px;
               }
               window#waybar {
                 background: rgba(0,0,0,0);
          margin-top: 2px;
               }
               #workspaces {
                 color: #${config.lib.stylix.colors.base0D};
                 background: #${config.lib.stylix.colors.base00};
                 padding: 3px 3px;
                 border-radius: 8px;
               }
               #workspaces button {
                 font-weight: bold;
                 padding: 0px 3px;
                 border-radius: 8px;
                 color: #${config.lib.stylix.colors.base00};
                 background: linear-gradient(45deg, #${config.lib.stylix.colors.base0D}, #${config.lib.stylix.colors.base0D});
                 opacity: 0.5;
                 transition: ${betterTransition};
               }
               #workspaces button.active {
                 font-weight: bold;
                 padding: 0px 3px;
                 border-radius: 8px;
                 color: #${config.lib.stylix.colors.base00};
                 background: linear-gradient(45deg, #${config.lib.stylix.colors.base0D}, #${config.lib.stylix.colors.base0D});
                 transition: ${betterTransition};
                 opacity: 1.0;
                 min-width: 20px;
               }
               #workspaces button:hover {
                 font-weight: bold;
                 border-radius: 8px;
                 color: #${config.lib.stylix.colors.base00};
                 background: linear-gradient(45deg, #${config.lib.stylix.colors.base0D}, #${config.lib.stylix.colors.base0D});
                 opacity: 0.8;
                 transition: ${betterTransition};
               }
               tooltip {
                 background: #${config.lib.stylix.colors.base00};
                 border: 1px solid #${config.lib.stylix.colors.base0D};
                 border-radius: 8px;
               }
               tooltip label {
                 color: #${config.lib.stylix.colors.base0D};
               }
               #window, #pulseaudio, #cpu, #memory, #network, #idle_inhibitor, #disk {
                 font-weight: bold;
                 margin-left: 7px;
                 padding: 0px 9px;
                 background: #${config.lib.stylix.colors.base00};
                 color: #${config.lib.stylix.colors.base0D};
                 border-radius: 4px 4px 4px 4px;
               }
               #idle_inhibitor {
               font-size: 10px;
               }
               #custom-startmenu {
                 color: #${config.lib.stylix.colors.base0D};
                 background: #${config.lib.stylix.colors.base00};
                 font-size: 10px;
                 margin: 0px;
                 padding: 0px 3px 0px 3px;
                 border-radius: 8px 8px 8px 8px;
               }
               #custom-hyprbindings, #battery,
               #custom-notification, #tray, #custom-exit {
                 /* font-weight: bold; */
                 font-size: 10px;
                 background: #${config.lib.stylix.colors.base00};
                 color: #${config.lib.stylix.colors.base0D};
                 margin-right: 7px;
                 border-radius: 4px 4px 4px 4px;
                 padding: 0px 9px;
               }
               #clock {
                 font-weight: bold;
                 font-size: 10px;
                 color: #${config.lib.stylix.colors.base0D};
                 background: linear-gradient(90deg, #${config.lib.stylix.colors.base00}, #${config.lib.stylix.colors.base00});
                 margin-right: 7px;
                 padding: 0px 9px;
                 border-radius: 4px 4px 4px 4px;
               }
        ''
      ];
    };
  }
