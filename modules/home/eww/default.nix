{config, ...}: let
  cfgDir = "${config.xdg.configHome}/eww";
in {
  programs.eww.enable = true;
  home.file = {
    "${cfgDir}/eww.yuck".source = ./eww.yuck;
    "${cfgDir}/scripts/vpns.py".source = ./scripts/vpns.py;
    "${cfgDir}/scripts/vpn_status.py".source = ./scripts/vpn_status.py;
    "${cfgDir}/scripts/search.sh".source = ./scripts/search.sh;
    "${cfgDir}/eww.scss".text = ''
      * {
        all: unset;
        font-family: JetBrainsMono Nerd Font Mono;
        font-size: 15px;
        border-radius: 6px;
        color: #${config.lib.stylix.colors.base0D};
      }

      window#vpn-window {
        background-color: rgba(0, 0, 0, 0);
        border-radius: 10px;
        padding: 8px;
      }

      .ip-box {
        padding: 4px 8px;
        margin-bottom: 6px;
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base0D};
        border-radius: 6px;
      }

      .list-vpn-box, .active-vpn-box, .searchapps-bar {
        background: #${config.lib.stylix.colors.base00};
        padding: 6px;
        margin: 4px;
        border-radius: 8px;
      }

      button {
        background: #${config.lib.stylix.colors.base00};
        color: #${config.lib.stylix.colors.base00};
        padding: 4px 8px;
        margin: 2px 0;
        border-radius: 6px;
        font-weight: bold;
        transition: all 0.3s ease;
      }

      button:hover {
        opacity: 1;
      }

      button:focus {
        outline: none;
      }

      #vpn-ui {
        padding: 8px;
      }
      .list-vpn-box, .active-vpn-box {
        transition: all 0.3s ease;
      }
    '';
  };
}
