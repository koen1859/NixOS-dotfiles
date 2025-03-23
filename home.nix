{ config, pkgs, inputs, ... }:

{
  imports = [
    ./shell.nix
    ./programs/fastfetch.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/waybar/waybar-ddubs.nix
    ./programs/wofi.nix
    ./programs/git.nix
    ./programs/hypr/hyprland.nix
    ./programs/hypr/animations.nix
    ./programs/hypr/keybindings.nix
    ./programs/hypr/windowrules.nix
    ./programs/gtk.nix
    ./programs/qt.nix
    ./programs/tmux.nix
    ./programs/stylix_home.nix
    ./programs/wlogout/wlogout.nix
    ./programs/swaync.nix
    ./programs/btop.nix
    ./programs/htop.nix
    ./programs/rofi/rofi.nix
  ];

  home.username = "koenstevens";
  home.homeDirectory = "/home/koenstevens";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
