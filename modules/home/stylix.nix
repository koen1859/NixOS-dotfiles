{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) wallpaper theme;
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
    iconTheme = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      dark = "Gruvbox-Plus-Dark";
      light = "Gruvbox-Plus-Dark";
    };
    autoEnable = true;
    targets = {
      waybar.enable = false;
      zathura.enable = false;
      spicetify.enable = false;
      firefox.profileNames = ["default"];
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
