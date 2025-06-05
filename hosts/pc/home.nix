{inputs, ...}: let
  home = "${inputs.self}/modules/home";
in {
  imports = [
    # ./llm.nix
    ./modules/hyprland.nix
    ./modules/packages.nix

    home
  ];
}
