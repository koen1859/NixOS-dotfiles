{ pkgs, ... }:

let
  inherit (import ./../wallpaper.nix) wallpaper;
in
{
  stylix = {
    enable = true;
    image = wallpaper;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/eighties.yaml";
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
      # starship.enable = false;
      waybar.enable = false;
      # kitty.enable = false;
      zathura.enable = false;
      # rofi.enable = false;
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
