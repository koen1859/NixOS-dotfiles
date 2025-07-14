{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
  inherit (import "${inputs.self}/secrets.nix") email;
in {
  programs = {
    git = {
      userName = username;
      userEmail = email;
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
