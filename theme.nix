{ pkgs, ... }:
let
  themeFile = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
in
{
  theme = themeFile;
  wallpaper = pkgs.runCommand "image.png" { theme = themeFile; } ''
    COLOR=$(${pkgs.yq}/bin/yq -r .palette.base00 $theme)
    ${pkgs.imagemagick}/bin/magick -size 1920x1080 xc:$COLOR $out
  '';
}
