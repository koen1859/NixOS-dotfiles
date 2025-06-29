{
  inputs,
  pkgs,
  config,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];
  programs.spicetify = {
    theme = spicePkgs.themes.default;
    customColorScheme = with config.lib.stylix.colors; {
      text = "${base0D}";
      subtext = "${base0D}";
      sidebar-text = "${base0D}";
      main = "${base00}";
      sidebar = "${base01}";
      player = "${base01}";
      card = "${base00}";
      shadow = "${base03}";
      selected-row = "${base03}";
      button = "${base0F}";
      button-active = "${base0D}";
      button-disabled = "${base0E}";
      tab-active = "${base03}";
      notification = "${base0A}";
      notification-error = "${base0F}";
      misc = "${base0D}";
      alt-text = "${base0D}";
      player-bar-bg = "${base01}";
      accent = "${base06}";
    };
    enabledExtensions = with spicePkgs.extensions; [
      shuffle
      trashbin
      powerBar
      history
    ];
  };
}
