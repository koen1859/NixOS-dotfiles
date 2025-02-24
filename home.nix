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
  qt.enable = true;

  # stylix.enable = true;
  # stylix.image = ./Wallpapers/Nebula.jpg;
}
