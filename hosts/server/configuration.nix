{
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
    ./modules/nixarr.nix
    # ./modules/packages.nix
    # ./modules/services.nix
  ];

  fileSystems."/data" = {
    device = "/dev/disk/by-uuid/8a919333-cd1d-4ba7-9d34-94f814e93b44";
    fsType = "ext4";
    options = ["defaults"];
  };

  networking.hostName = "nixserver";
}
