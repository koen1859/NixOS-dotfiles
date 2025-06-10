{inputs, ...}: let
  home = "${inputs.self}/modules/home";
in {
  imports = [
    ./modules/hyprland.nix
    ./modules/packages.nix

    home
  ];
}
