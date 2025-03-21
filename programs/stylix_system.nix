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
    };
  };
}
