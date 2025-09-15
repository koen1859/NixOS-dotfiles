{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = ["hyprland/window"];
        modules-left = ["hyprland/workspaces"];
        modules-right = [
          "pulseaudio"
          "cpu"
          "memory"
          "disk"
          "network"
          "custom/notification"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          persistent-workspaces = {
            "*" = 9;
          };
        };
        "clock" = {
          format = '' {:L%H:%M}'';
          tooltip = true;
          tooltip-format = "<big>{:%A, %d %B %Y }</big>\n<tt><small>{calendar}</small></tt>";
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
          format = " {used}GiB";
          tooltip = true;
        };
        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
        };
        "disk" = {
          format = " {free}";
          interval = 60;
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
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
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
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -op";
          escape = true;
        };
        "battery" = {
          states = {
            good = 90;
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
    style = lib.concatStrings [
      ''
        * {
          font-family: JetBrainsMono Nerd Font;
          font-size: 16px;
          font-weight: bold;
        }
        window#waybar {
          background-color: #${config.lib.stylix.colors.base00};
        }
        #workspaces button {
          padding: 0px 6px;
          color: #${config.lib.stylix.colors.base09};
          background: transparent;
        }
        #workspaces button.active {
          color: #${config.lib.stylix.colors.base0B};
          border-bottom: 3px solid #${config.lib.stylix.colors.base0B};
        }
        #workspaces button.empty.active {
          color: #${config.lib.stylix.colors.base0B};
          border-bottom: 3px solid #${config.lib.stylix.colors.base0B};
        }
        #workspaces button.empty {
          color: #${config.lib.stylix.colors.base08}
        }
        tooltip {
          border: 1px solid #${config.lib.stylix.colors.base0B};
          border-radius: 8px;
        }
        tooltip label {
          color: #${config.lib.stylix.colors.base0B};
        }
        #window {
          margin-left: 7px;
          padding: 0px 9px;
        }
        #window {
          color: #${config.lib.stylix.colors.base09};
          border-bottom: 4px solid #${config.lib.stylix.colors.base09};
        }
        #battery, #custom-notification, #clock, #pulseaudio, #cpu, #memory, #network, #disk {
          margin-right: 7px;
          padding: 0px 9px;
        }
        #network {
          color: #${config.lib.stylix.colors.base08};
          border-bottom: 4px solid #${config.lib.stylix.colors.base08};
        }
        #pulseaudio {
          color: #${config.lib.stylix.colors.base09};
          border-bottom: 4px solid #${config.lib.stylix.colors.base09};
        }
        #battery {
          color: #${config.lib.stylix.colors.base0A};
          border-bottom: 4px solid #${config.lib.stylix.colors.base0A};
        }
        #cpu {
          color: #${config.lib.stylix.colors.base0B};
          border-bottom: 4px solid #${config.lib.stylix.colors.base0B};
        }
        #memory {
          color: #${config.lib.stylix.colors.base0C};
          border-bottom: 4px solid #${config.lib.stylix.colors.base0C};
        }
        #custom-notification {
          color: #${config.lib.stylix.colors.base0D};
          border-bottom: 4px solid #${config.lib.stylix.colors.base0D};
        }
        #disk {
          color: #${config.lib.stylix.colors.base0E};
          border-bottom: 4px solid #${config.lib.stylix.colors.base0E};
        }
        #clock {
          color: #${config.lib.stylix.colors.base0F};
          border-bottom: 4px solid #${config.lib.stylix.colors.base0F};
        }
      ''
    ];
  };
}
