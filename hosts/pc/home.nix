{inputs, ...}: let
  home = "${inputs.self}/modules/home/server.nix";
in {
  imports = [
    ./modules/hyprland.nix
    ./modules/packages.nix

    home
  ];
}
