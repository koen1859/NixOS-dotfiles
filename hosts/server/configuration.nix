{inputs, ...}: let
  core = "${inputs.self}/modules/core";
in {
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
    ./modules/nixarr.nix
    # ./modules/packages.nix
    # ./modules/services.nix

    core
  ];

  networking.hostName = "nixserver";
}
