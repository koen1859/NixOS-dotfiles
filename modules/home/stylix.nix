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
    image = wallpaper;
    base16Scheme = theme;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 15;
    };
    autoEnable = true;
    targets = {
      waybar.enable = false;
      zathura.enable = false;
      spicetify.enable = false;
      ghostty.enable = false;
      firefox.profileNames = ["default"];
      wezterm.enable = true;
      nixvim = {
        transparentBackground = {
          main = true;
          numberLine = true;
          signColumn = true;
        };
      };
    };
  };
}
