{inputs, ...}: let
  home = "${inputs.self}/modules/home";
in {
  imports = [
    ./modules/hyprland.nix

    home
  ];

  programs.home-manager.enable = true;
}
