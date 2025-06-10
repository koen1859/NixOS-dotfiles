{inputs, ...}: let
  core = "${inputs.self}/modules/core";
in {
  imports = [
    "${core}/bootloader.nix"
    "${core}/environment.nix"
    "${core}/services.nix"
    "${core}/users.nix"
    "${core}/programs.nix"
    "${core}/misc.nix"
    "${core}/stylix.nix"
    "${core}/network.nix"
    "${core}/nixpkgs.nix"
    "${core}/nix.nix"
    "${core}/nh.nix"
  ];

  system.stateVersion = "24.11";
}
