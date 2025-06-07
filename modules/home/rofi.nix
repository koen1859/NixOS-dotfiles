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
        padding = mkLiteral "0px";
        margin = mkLiteral "0px";
      };

      window = {
        fullscreen = true;
        padding = mkLiteral "1em";
        background-color = mkLiteral "${base00}dd";
      };

      mainbox = {
        padding = mkLiteral "8px";
      };

      inputbar = {
        background-color = mkLiteral "${base0D}20";

        margin = mkLiteral "0px calc( 50% - 230px )";
        padding = mkLiteral "4px 8px";
        spacing = mkLiteral "8px";

        border = mkLiteral "1px";
        border-radius = mkLiteral "2px";
        border-color = mkLiteral "${base0D}40";

        children = map mkLiteral [
          "icon-search"
          "entry"
        ];
      };

      prompt = {
        enabled = false;
      };

      icon-search = {
        expand = false;
        filename = "search";
        vertical-align = mkLiteral "0.5";
      };

      entry = {
        placeholder = "Search";
        placeholder-color = mkLiteral "${base0D}20";
      };

      listview = {
        margin = mkLiteral "48px calc( 50% - 720px )";
        margin-bottom = mkLiteral "0px";
        spacing = mkLiteral "48px";
        columns = 6;
        fixed-columns = true;
      };

      "element, element-text, element-icon" = {
        cursor = mkLiteral "pointer";
      };

      element = {
        padding = mkLiteral "8px";
        spacing = mkLiteral "4px";

        orientation = mkLiteral "vertical";
        border-radius = mkLiteral "12px";
      };

      "element selected" = {
        background-color = mkLiteral "${base0D}33";
      };

      element-icon = {
        size = mkLiteral "5.75em";
        horizontal-align = mkLiteral "0.5";
      };

      element-text = {
        horizontal-align = mkLiteral "0.5";
      };
    };
  };
}
