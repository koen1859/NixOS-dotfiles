{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ./programs/fastfetch.nix
    ./programs/kitty.nix
    ./programs/starship.nix
    ./programs/waybar.nix
    ./programs/wofi.nix
    ./programs/git.nix
    ./programs/hyprland.nix
  ];

  home.username = "koenstevens";
  home.homeDirectory = "/home/koenstevens";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  programs.home-manager.enable = true;
}
