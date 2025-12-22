{
  config,
  pkgs,
  username,
  ...
}: let
  inherit (config.lib.stylix) colors;
in {
  programs = {
    dankMaterialShell = {
      enable = true;
      quickshell.package = pkgs.quickshell;
      enableSystemMonitoring = true;
      enableClipboard = true;
      enableVPN = true;
      enableDynamicTheming = false;
      enableAudioWavelength = true;
      enableCalendarEvents = true;
      default.settings = {
        theme = "dark";
        customThemeName = "Gruvbox Dark Hard";
        customThemeFile = "/home/${username}/.config/DankMaterialShell/theme.json";
        useAutoLocation = true;
        soundsEnabled = false;
        showWorkspaceIndex = true;
        dwlShowAllTags = true;
      };
    };
    nix-monitor = {
      enable = true;
      generationsCommand = [
        "sh"
        "-c"
        "home-manager generations 2>/dev/null | wc -l"
      ];
      rebuildCommand = [
        "bash"
        "-c"
        "nh home switch -- --impure 2>&1"
      ];
    };
  };
  xdg.configFile."DankMaterialShell/theme.json".text = ''
    {
      "name":  "Gruvbox Dark Hard",
      "primary": "#${colors.base0D}",
      "primaryText": "#${colors.base07}",
      "primaryContainer": "#${colors.base02}",
      "secondary": "#${colors.base01}",
      "surface": "#${colors.base00}",
      "surfaceText": "#${colors.base0C}",
      "surfaceVariant": "#${colors.base01}",
      "surfaceVariantText": "#${colors.base0B}",
      "background": "#${colors.base00}",
      "backgroundText": "#${colors.base07}",
      "outline": "#${colors.base0D}",
      "surfaceContainer": "#${colors.base00}",
      "surfaceContainerHigh": "#${colors.base02}",
      "surfaceContainerHighest": "#${colors.base03}",
      "error": "#${colors.base08}",
      "warning": "#${colors.base0F}",
      "info": "#${colors.base0D}",
      "matugen_type": "sheme-rainbow"
    }
  '';
}
