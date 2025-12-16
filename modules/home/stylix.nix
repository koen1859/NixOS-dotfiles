{
  pkgs,
  wallpaper,
  ...
}: {
  stylix = {
    enable = true;
    image = wallpaper;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
    opacity.terminal = 0.7;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };
    iconTheme = {
      enable = true;
      package = pkgs.gruvbox-plus-icons;
      dark = "Gruvbox-Plus-Dark";
      light = "Gruvbox-Plus-Dark";
    };
    autoEnable = true;
    targets = {
      noctalia-shell.enable = false;
      waybar.enable = false;
      spicetify.enable = false;
      firefox = {
        profileNames = ["default"];
        colorTheme.enable = true;
      };
      zen-browser = {
        profileNames = ["default"];
      };
    };
  };
}
