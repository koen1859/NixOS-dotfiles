{ pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ./../Wallpapers/NixRainbow.png;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    autoEnable = true;
    targets = {
      gtk.enable = true;
      qt.enable = true;
      wofi.enable = false;
      hyprland.enable = false;
      starship.enable = false;
      waybar.enable = false;
    };
  };
}
