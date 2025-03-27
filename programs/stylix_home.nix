{ pkgs, ... }:

let
  # inherit (import ./../wallpaper.nix) wallpaper;
  inherit (import ../theme.nix) theme wallpaper;
in
{
  stylix = {
    enable = true;
    image = wallpaper;
    base16scheme = theme;
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
      hyprland.enable = false;
      starship.enable = false;
      waybar.enable = false;
      kitty.enable = false;
      zathura.enable = false;
      rofi.enable = false;
    };
  };
}
