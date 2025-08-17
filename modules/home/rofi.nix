{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkForce;
  inherit (config.lib.formats.rasi) mkLiteral;
  inherit (config.lib.stylix.colors.withHashtag) base00 base0D;
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
        background-color = mkLiteral "transparent";
        foreground = mkLiteral "${base0D}";
        text-color = mkLiteral "${base0D}";
      };

      window = {
        background-color = mkLiteral "${base00}dd";
      };

      inputbar = {
        background-color = mkLiteral "${base0D}20";
        border-color = mkLiteral "${base0D}40";
      };

      entry = {
        placeholder = "Search";
        placeholder-color = mkLiteral "${base0D}20";
      };

      "element selected" = {
        background-color = mkLiteral "${base0D}33";
      };
    };
  };
}
