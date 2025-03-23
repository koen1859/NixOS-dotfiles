{ pkgs, ... }:

let
  inherit (import ./../wallpaper.nix) wallpaper;
in
{
  stylix = {
    enable = true;
    image = wallpaper;
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
      kitty.enable = false;
      zathura.enable = false;
    };
  };
}
