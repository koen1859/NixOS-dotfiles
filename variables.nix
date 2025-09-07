{
  inputs,
  pkgs,
  ...
}: {
  username = "koenstevens";
  theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
  wallpaper = ./wallpapers/solar_system.png;
  core = "${inputs.self}/modules/core";
  home = "${inputs.self}/modules/home";
  shell = pkgs.zsh;
}
