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
            "custom/startmenu"
            "hyprland/window"
            "pulseaudio"
            "cpu"
            "memory"
            "network"
          ];
          modules-right = [
            "custom/notification"
            "custom/exit"
            "battery"
            "tray"
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
          };
          "tray" = {
            spacing = 12;
          };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "sleep 0.1 && pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "";
            on-click = "sleep 0.1 && wlogout";
          };
          "custom/startmenu" = {
            tooltip = false;
            format = "";
            on-click = "wofi -show drun";
            # on-click = "sleep 0.1 && rofi-launcher";
            # on-click = "sleep 0.1 && nwg-drawer -mb 200 -mt 200 -mr 200 -ml 200";
          };
          "custom/hyprbindings" = {
            tooltip = false;
            format = "󱕴";
            on-click = "sleep 0.1 && list-keybinds";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
            tooltip = "true";
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
            on-click = "sleep 0.1 && swaync-client -op";
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
            min-height: 0px;
          }
          window#waybar {
            background: rgba(0,0,0,0);
          }
          #workspaces {
            color: #${config.lib.stylix.colors.base00};
            background: #${config.lib.stylix.colors.base01};
            margin: 2px 2px;
            padding: 3px 3px;
            border-radius: 8px;
          }
          #workspaces button {
            font-weight: bold;
            padding: 0px 3px;
            margin: 0px 2px;
            border-radius: 8px;
            color: #${config.lib.stylix.colors.base00};
            background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
            opacity: 0.5;
            transition: ${betterTransition};
          }
          #workspaces button.active {
            font-weight: bold;
            padding: 0px 3px;
            margin: 0px 2px;
            border-radius: 8px;
            color: #${config.lib.stylix.colors.base00};
            background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
            transition: ${betterTransition};
            opacity: 1.0;
            min-width: 20px;
          }
          #workspaces button:hover {
            font-weight: bold;
            border-radius: 8px;
            color: #${config.lib.stylix.colors.base00};
            background: linear-gradient(45deg, #${config.lib.stylix.colors.base08}, #${config.lib.stylix.colors.base0D});
            opacity: 0.8;
            transition: ${betterTransition};
          }
          tooltip {
            background: #${config.lib.stylix.colors.base00};
            border: 1px solid #${config.lib.stylix.colors.base08};
            border-radius: 8px;
          }
          tooltip label {
            color: #${config.lib.stylix.colors.base08};
          }
          #window, #pulseaudio, #cpu, #memory, #idle_inhibitor {
            font-weight: bold;
            margin: 4px 0px;
            margin-left: 7px;
            padding: 0px 9px;
            background: #${config.lib.stylix.colors.base00};
            color: #${config.lib.stylix.colors.base08};
            border-radius: 4px 4px 4px 4px;
          }
          #idle_inhibitor {
          font-size: 10px;
          }
          #custom-startmenu {
            color: #${config.lib.stylix.colors.base0B};
            background: #${config.lib.stylix.colors.base02};
            font-size: 10px;
            margin: 0px;
            padding: 0px 3px 0px 3px;
            border-radius: 8px 8px 8px 8px;
          }
          #custom-hyprbindings, #network, #battery,
          #custom-notification, #tray, #custom-exit {
            /* font-weight: bold; */
            font-size: 10px;
            background: #${config.lib.stylix.colors.base00};
            color: #${config.lib.stylix.colors.base08};
            margin: 2px 0px;
            margin-right: 4px;
            border-radius: 4px 4px 4px 4px;
            padding: 0px 9px;
          }
          #clock {
            font-weight: bold;
            font-size: 10px;
            color: #0D0E15;
            background: linear-gradient(90deg, #${config.lib.stylix.colors.base0B}, #${config.lib.stylix.colors.base02});
            margin: 0px;
            padding: 0px 3px 0px 3px;
            border-radius: 8px 8px 8px 8px;
          }
        ''
      ];
    };
  }
