{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) core;
in {
  imports = [
    "${core}/boot.nix"
    "${core}/environment.nix"
    "${core}/services.nix"
    "${core}/users.nix"
    "${core}/programs.nix"
    "${core}/stylix.nix"
    "${core}/network.nix"
    "${core}/nh.nix"
  ];

  system.stateVersion = "24.11";
}
