{inputs, ...}: let
  core = "${inputs.self}/modules/core";
  home = "${inputs.self}/modules/home";
in {
  imports = [
    ./modules/hyprland.nix

    "${home}"
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    sessionVariables = {
      TEXMFHOME = "~/.texmf/";
    };
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
