{pkgs, ...}:
pkgs.writeShellScriptBin "BSc_Thesis" ''
  ${pkgs.wezterm}/bin/wezterm start --config-file ~/.config/wezterm/multitab.lua
''
