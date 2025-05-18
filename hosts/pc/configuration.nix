{inputs, ...}: let
  core = "${inputs.self}/modules/core";
in {
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
    ./modules/gaming.nix

    core
  ];

  networking.hostName = "nixpc";

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/sda1";
    fsType = "ext4";
    options = ["defaults"];
  };
}
