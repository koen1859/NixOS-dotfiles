{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
in {
  programs.nh = {
    enable = true;
    flake = "/home/${username}/.dotfiles/";
    clean = {
      enable = true;
      dates = "weekly";
    };
  };
}
