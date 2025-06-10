{inputs, ...}: let
  home = "${inputs.self}/modules/home";
in {
  imports = [
    "${home}/fetch"
    "${home}/hypr"
    "${home}/nvf"
    "${home}/wlogout"
    "${home}/wezterm"
    "${home}/atuin.nix"
    "${home}/bash.nix"
    "${home}/btop.nix"
    "${home}/git.nix"
    "${home}/librewolf.nix"
    "${home}/packages.nix"
    "${home}/qt.nix"
    "${home}/rofi.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
    "${home}/swaync.nix"
    "${home}/waybar.nix"
    "${home}/zathura.nix"
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
