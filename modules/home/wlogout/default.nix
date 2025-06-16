{
  config,
  pkgs,
  ...
}: {
  programs.wlogout = {
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "";
        keybind = "s";
      }
      {
        "label" = "reboot";
        "action" = "sleep 1; systemctl reboot";
        "text" = "󰦛";
        "keybind" = "r";
      }
      {
        "label" = "logout";
        "action" = "sleep 1; hyprctl dispatch exit";
        "text" = "󰈆";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "sleep 1; systemctl suspend";
        "text" = "󰤄";
        "keybind" = "u";
      }
      {
        "label" = "lock";
        "action" = "sleep 1; ${pkgs.hyprlock}/bin/hyprlock";
        "text" = "";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "sleep 1; systemctl hibernate";
        "text" = "";
        "keybind" = "h";
      }
    ];
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
      	background-image: none;
      	transition: 20ms;
        font-size: 200px;
      }
      window {
      	background-color: alpha(#${config.lib.stylix.colors.base00},.2);
      }
      button {
      	color: #${config.lib.stylix.colors.base0D};
      	background-color: #${config.lib.stylix.colors.base00};
      }
      button:focus,
      button:active,
      button:hover {
        color: #${config.lib.stylix.colors.base0D};
        background-color: #${config.lib.stylix.colors.base00};
      }
      #logout, #suspend, #shutdown, #reboot, #lock, #hibernate {
        margin: 10px;
      }
    '';
  };
}
