{ config, pkgs, inputs, ... }:

{
  imports = [
    ./shell.nix
    ./programs/fastfetch.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/waybar.nix
    ./programs/wofi.nix
    ./programs/git.nix
    ./programs/hypr/hyprland.nix
    ./programs/hypr/animations.nix
    ./programs/hypr/keybindings.nix
    ./programs/hypr/windowrules.nix
    ./programs/gtk.nix
    ./programs/qt.nix
    ./programs/tmux.nix
  ];

  home.username = "koenstevens";
  home.homeDirectory = "/home/koenstevens";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
  ];

  home.file = {
  };

  programs.home-manager.enable = true;

  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern_Ice";

  qt.enable = true;
}
