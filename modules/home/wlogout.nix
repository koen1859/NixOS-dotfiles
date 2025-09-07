{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = " ";
        keybind = "s";
      }
      {
        "label" = "reboot";
        "action" = "sleep 1; systemctl reboot";
        "text" = "󰦛 ";
        "keybind" = "r";
      }
      {
        "label" = "logout";
        "action" = "sleep 1; hyprctl dispatch exit";
        "text" = "󰈆 ";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "sleep 1; systemctl suspend";
        "text" = "󰤄 ";
        "keybind" = "u";
      }
      {
        "label" = "lock";
        "action" = "sleep 1; ${pkgs.hyprlock}/bin/hyprlock";
        "text" = " ";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "sleep 1; systemctl hibernate";
        "text" = " ";
        "keybind" = "h";
      }
    ];
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
      	background-image: none;
        font-size: 250px;
      }
      window {
      	background-color: alpha(#${config.lib.stylix.colors.base00},.8);
      }
      button {
      	color: #${config.lib.stylix.colors.base0D};
      	background-color: #${config.lib.stylix.colors.base00};
      }
      button:focus,
      button:active,
      button:hover {
        color: #${config.lib.stylix.colors.base0C};
        background-color: #${config.lib.stylix.colors.base00};
      }
      #logout, #suspend, #shutdown, #reboot, #lock, #hibernate {
        margin: 30px;
      }
    '';
  };
}
