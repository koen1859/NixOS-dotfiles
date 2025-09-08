{
  config,
  pkgs,
  lib,
  ...
}: let
  stylixColors = config.lib.stylix.colors;

  # Map each icon to a Stylix base color
  iconColors = {
    shutdown = stylixColors.base08;
    reboot = stylixColors.base09;
    logout = stylixColors.base0A;
    suspend = stylixColors.base0B;
    lock = stylixColors.base0C;
    hibernate = stylixColors.base0E;
  };

  recoloredIcons = pkgs.stdenv.mkDerivation {
    name = "recolored-wlogout-icons";
    src = ./icons;

    nativeBuildInputs = [pkgs.imagemagick];

    buildPhase = ''
      mkdir -p $out
      ${lib.concatStringsSep "\n" (lib.mapAttrsToList (icon: color: ''
          convert $src/${icon}.png -fill "#${color}" -colorize 100% $out/${icon}.png
        '')
        iconColors)}
    '';
  };
in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "sleep 1; systemctl reboot";
        keybind = "r";
      }
      {
        label = "logout";
        action = "sleep 1; hyprctl dispatch exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "sleep 1; systemctl suspend";
        keybind = "u";
      }
      {
        label = "lock";
        action = "sleep 1; ${pkgs.hyprlock}/bin/hyprlock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "sleep 1; systemctl hibernate";
        keybind = "h";
      }
    ];
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 15pt;
      }
      window {
      	background-color: alpha(#${config.lib.stylix.colors.base00},.8);
      }
      button {
      	color: #${config.lib.stylix.colors.base0D};
      	background-color: #${config.lib.stylix.colors.base00};
        background-repeat: no-repeat;
        background-position: center;
        background-size: 30%;
        margin: 10px;
      }
      button:focus,
      button:active,
      button:hover {
        color: #${config.lib.stylix.colors.base0C};
        background-color: #${config.lib.stylix.colors.base00};
      }
      #shutdown {
        background-image: image(url("${recoloredIcons}/shutdown.png"));
      }
      #logout {
        background-image: image(url("${recoloredIcons}/logout.png"));
      }
      #suspend {
        background-image: image(url("${recoloredIcons}/suspend.png"));
      }
      #reboot {
        background-image: image(url("${recoloredIcons}/reboot.png"));
      }
      #lock {
        background-image: image(url("${recoloredIcons}/lock.png"));
      }
      #hibernate {
        background-image: image(url("${recoloredIcons}/hibernate.png"));
      }
    '';
  };
}
