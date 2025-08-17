{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) home username;
in {
  imports = [
    "${home}/browser"
    "${home}/hypr"
    "${home}/terminal"
    "${home}/scripts"
    "${home}/shell"
    "${home}/atuin.nix"
    "${home}/btop.nix"
    "${home}/fastfetch.nix"
    "${home}/git.nix"
    "${home}/latex.nix"
    "${home}/nixcord.nix"
    "${home}/packages.nix"
    "${home}/programming.nix"
    "${home}/qt.nix"
    "${home}/rofi.nix"
    "${home}/spicetify.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
    "${home}/swaync.nix"
    "${home}/waybar.nix"
    "${home}/wlogout.nix"
    "${home}/zathura.nix"
    "${home}/zoxide.nix"
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    sessionVariables = {
      nixos_ozone_wl = "1";
      EDITOR = "nvim";
      HYPRSHOT_DIR = "/home/${username}/Pictures/";
    };
  };
  programs = {
    home-manager.enable = true;
  };
}
