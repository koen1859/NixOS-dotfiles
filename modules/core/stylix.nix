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
    polarity = "dark";
    base16Scheme = theme;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
    autoEnable = true;
  };
}
