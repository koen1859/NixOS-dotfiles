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

  home.packages = [
  ];

  home.file = {
  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-dark-gtk;
    };
    iconTheme = {
      name = "Gruvbox-Dark-Icons";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    cursorTheme = {
      name = "Qogir";
      package = pkgs.qogir-theme;
      size = 24;
    };
  };

  programs.home-manager.enable = true;
}
