{pkgs, ...}: let
  inherit (import ../../wallpaper.nix) wallpaper;
  inherit (import ../../theme.nix {inherit pkgs;}) theme;
  painted_wallpaper = pkgs.runCommand "painted_wallpaper.png" {} ''
    BASE_COLOR=$(${pkgs.yq}/bin/yq -r .palette.base0A ${theme})
    ${pkgs.imagemagick}/bin/magick ${wallpaper} -fill "$BASE_COLOR" -colorize 30% $out
  '';
in {
  stylix = {
    enable = true;
    image = painted_wallpaper;
    base16Scheme = theme;
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
      hyprland.enable = true;
      waybar.enable = false;
      zathura.enable = false;
    };

    # fonts = {
    #   monospace = {
    #     package = pkgs.nerd-fonts.jetbrains-mono;
    #     name = "JetBrains Mono";
    #   };
    #   sansSerif = {
    #     package = pkgs.montserrat;
    #     name = "Montserrat";
    #   };
    #   serif = {
    #     package = pkgs.montserrat;
    #     name = "Montserrat";
    #   };
    #   sizes = {
    #     applications = 12;
    #     terminal = 15;
    #     desktop = 11;
    #     popups = 12;
    #   };
    # };
  };
}
