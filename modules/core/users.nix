{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) shell username;
in {
  users = {
    defaultUserShell = shell;
    users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };
}
