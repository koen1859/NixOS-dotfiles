{pkgs, ...}: {
  programs.wezterm = {
    enable = true;
    package = pkgs.wezterm;
  };
  home.file."./.config/wezterm/wezterm.lua".source = ./wezterm.lua;
}
