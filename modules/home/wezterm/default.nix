{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
  };
  home.file."./.config/wezterm/wezterm.lua".text = ''
    -- Config from Drew @justaguylinux small mods

    local wezterm = require("wezterm")

    local config = wezterm.config_builder()

    config.enable_wayland = false
    config.color_scheme = 'Gruvbox dark, hard (base16)'
    -- config.color_scheme = 'tokyonight_night'
    config.font_size = 13
    config.audible_bell = "Disabled"

    config.warn_about_missing_glyphs=false

    config.window_padding = {
      left = 10,
      right = 10,
      top = 10,
      bottom = 10,
    }

    config.enable_tab_bar = false

    config.default_cursor_style = "BlinkingUnderline"
    config.cursor_blink_rate = 500
    config.term = "xterm-256color"
    config.max_fps = 144
    config.animation_fps = 30
    config.window_background_opacity = 0.6

    -- Keybindings using ALT for tabs & splits
    config.keys = {
      -- Tab management
      { key = "t", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
      { key = "w", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
      { key = "n", mods = "ALT", action = wezterm.action.ActivateTabRelative(1) },
      { key = "p", mods = "ALT", action = wezterm.action.ActivateTabRelative(-1) },

      -- Pane management
      { key = "-", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
      { key = "p", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
      { key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

      -- Pane navigation (move between panes with ALT + Arrows)
      { key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
      { key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
      { key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
      { key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

      { key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
      { key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
      { key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
      { key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
      { key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
      { key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
      { key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
      { key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
      { key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
    }
    return config
  '';
}
