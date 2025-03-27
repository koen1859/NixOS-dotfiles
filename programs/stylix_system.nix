{ pkgs, ... }:

let
  inherit (import ./../wallpaper.nix) wallpaper;
in
{
  stylix = {
    enable = true;
    image = wallpaper;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-medium.yaml";
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
