{inputs, ...}: let
  core = "${inputs.self}/modules/core";
in {
  imports = [
    ./modules/hardware.nix
    ./modules/tlp.nix

    "${core}"
  ];

  system.stateVersion = "24.11";

  networking.hostName = "nixlaptop";

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
    options = ["defaults"];
  };
}
