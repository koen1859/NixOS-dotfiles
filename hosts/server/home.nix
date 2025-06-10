{inputs, ...}: let
  home = "${inputs.self}/modules/home/server.nix";
in {
  imports = [
    ./modules/hyprland.nix

    home
  ];

  programs.home-manager.enable = true;
}
