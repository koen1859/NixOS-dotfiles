{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
in {
  programs = {
    git = {
      userName = username;
      userEmail = "github.follicle106@passmail.net";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
