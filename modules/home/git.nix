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
      userEmail = "gitlab.slurp563@passmail.net";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
