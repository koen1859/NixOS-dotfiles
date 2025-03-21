{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ./Wallpapers/NixRainbow.png;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    targets = {
      gtk.enable = true;
      qt.enable = true;
      hyprland.enable = true;
      waybar.enable = true;
    };
  };
}
