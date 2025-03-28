{pkgs, ...}: let
  inherit (import ../../wallpaper.nix) wallpaper;
  inherit (import ../../theme.nix {inherit pkgs;}) theme;
  painted_wallpaper = pkgs.runCommand "painted_wallpaper.png" {} ''
    COLOR1=$(${pkgs.yq}/bin/yq -r .palette.base00 ${theme})
    COLOR2=$(${pkgs.yq}/bin/yq -r .palette.base0F ${theme})

    ${pkgs.imagemagick}/bin/magick ${wallpaper} \
      +level-colors "$COLOR1","$COLOR2" $out
  '';
in {
  stylix = {
    enable = true;
    image = painted_wallpaper;
    polarity = "dark";
    base16Scheme = theme;
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
