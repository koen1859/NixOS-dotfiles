{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (config.lib.stylix.colors.withHashtag) base00 base08 base09 base0A base0B base0C base0D base0E base0F;
in {
  programs.rofi = {
    enable = true;
    cycle = false;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun,filebrowser,ssh";
      show-icons = true;
      disable-history = false;
      hover-select = true;
      bw = 0;
      display-drun = "";
      display-filebrowser = "";
      display-ssh = "";
      display-window = "";
      display-combi = "";
      icon-theme = "Fluent-dark";
      terminal = "wezterm";
      drun-match-fields = "name";
      drun-display-format = "{name}";
      me-select-entry = "";
      me-accept-entry = "MousePrimary";
      kb-cancel = "Escape,MouseMiddle";
    };

    theme = mkForce {
      "*" = {
        background-color = mkLiteral "${base00}dd";
        foreground-color = mkLiteral "${base0D}";
        text-color = mkLiteral "${base0B}";
      };

      window = {
        background-color = mkLiteral "${base00}dd";
        border-color = mkLiteral "${base0D}";
        border = mkLiteral "1px";
        border-size = mkLiteral "5px";
        padding = mkLiteral "5px";
        width = mkLiteral "33%";
      };

      mainbox = {
        border = 0;
        padding = mkLiteral "2px";
      };

      listview = {
        fixed-height = 0;
        border = mkLiteral "1px 1px 1px";
        border-color = mkLiteral "${base0D}";
        spacing = mkLiteral "5px";
        scrollbar = mkLiteral "false";
        padding = mkLiteral "1px 1px 1px";
        lines = 20;
      };

      element = {
        border = 0;
        padding = mkLiteral "3px";
        cursor = mkLiteral "pointer";
        spacing = mkLiteral "5px";
      };

      element-text = {
        background-color = mkLiteral "transparent";
        cursor = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      entry = {
        placeholder = "Search";
        placeholder-color = mkLiteral "${base0A}";
      };

      "element selected" = {
        background-color = mkLiteral "${base0D}33";
      };
    };
  };
}
