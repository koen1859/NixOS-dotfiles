{ config, lib, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        reload_style_on_change = true;

        modules-left = [
          "custom/notification"
          "clock"
          "tray"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "group/expand"
          "bluetooth"
          "network"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
            empty = "";
          };
          persistent-workspaces = {
            "*" = [ 1 2 3 4 5 ];
          };
        };

        "custom/notification" = {
          tooltip = false;
          format = "";
          on-click = "swaync-client -t -sw";
          escape = true;
        };

        clock = {
          format = "{:%H:%M:%S} ";
          interval = 1;
          tooltip-format = "<tt>{calendar}</tt>";
          calendar = {
            format = {
              today = "<span color='#fAfBfC'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
          };
        };

        network = {
          format-wifi = "";
          format-ethernet = "";
          format-disconnected = "";
          tooltip-format-disconnected = "Error";
          tooltip-format-wifi = "{essid} ({signalStrength}%) ";
          tooltip-format-ethernet = "{ifname} 🖧 ";
          on-click = "kitty nmtui";
        };

        bluetooth = {
          format-on = "󰂯";
          format-off = "BT-off";
          format-disabled = "󰂲";
          format-connected-battery = "{device_battery_percentage}% 󰂯";
          format-alt = "{device_alias} 󰂯";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
          on-click-right = "blueman-manager";
        };

        battery = {
          interval = 30;
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-plugged = "{capacity}% 󰂄 ";
          format-alt = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        "custom/expand" = {
          format = "";
          tooltip = false;
        };

        "custom/endpoint" = {
          format = "|";
          tooltip = false;
        };

        "group/expand" = {
          orientation = "horizontal";
          drawer = {
            transition-duration = 600;
            transition-to-left = true;
            click-to-reveal = true;
          };
          modules = [
            "custom/expand"
            "cpu"
            "memory"
            "temperature"
            "custom/endpoint"
          ];
        };

        cpu = {
          format = "󰻠";
          tooltip = true;
        };

        memory = {
          format = "";
        };

        temperature = {
          critical-threshold = 80;
          format = "";
        };

        tray = {
          icon-size = 14;
          spacing = 10;
        };
      };
    };
    style = ''
      @import url('../../.cache/wal/colors-waybar.css');

      * {
        font-size: 10px;
        font-family: "CodeNewRoman Nerd Font Propo";
      }

      window#waybar {
        all: unset;
      }

      .modules-left, .modules-center, .modules-right {
        padding: 7px;
        margin: 5px;
        border-radius: 10px;
        background: alpha(@background, .5);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      tooltip {
        background: @background;
        color: @color7;
      }

      #clock:hover,
      #custom-pacman:hover,
      #custom-notification:hover,
      #bluetooth:hover,
      #network:hover,
      #battery:hover,
      #cpu:hover,
      #memory:hover,
      #temperature:hover {
        transition: all .3s ease;
        color: @color9;
      }

      #custom-notification, #clock, #custom-pacman, #bluetooth, #network, #battery {
        padding: 0px 5px;
        transition: all .3s ease;
        color: @color7;
      }

      #workspaces {
        padding: 0px 5px;
      }

      #workspaces button {
        all: unset;
        padding: 0px 5px;
        color: alpha(@color9, .4);
        transition: all .2s ease;
      }

      #workspaces button:hover {
        color: rgba(0, 0, 0, 0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }

      #workspaces button.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }

      #workspaces button.empty {
        color: rgba(0, 0, 0, 0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
      }

      #workspaces button.empty:hover,
      #workspaces button.empty.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
      }

      #battery.charging {
        color: #26A65B;
      }

      #battery.warning:not(.charging) {
        color: #ffbe61;
      }

      #battery.critical:not(.charging) {
        color: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #group-expand, #custom-expand {
        padding: 0px 5px;
        transition: all .3s ease;
      }

      #custom-expand {
        color: alpha(@foreground, .2);
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
      }

      #custom-expand:hover {
        color: rgba(255, 255, 255, .2);
        text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
      }

      #custom-colorpicker, #cpu, #memory, #temperature, #tray {
        padding: 0px 5px;
        transition: all .3s ease;
        color: @color7;
      }

      #custom-endpoint {
        color: transparent;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);
      }

      #tray menu *, #tray menu separator {
        padding: 0px 5px;
        transition: all .3s ease;
      }
    '';
  };
}
