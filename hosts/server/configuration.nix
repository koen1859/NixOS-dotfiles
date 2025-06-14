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
    device = "/dev/sda1";
    fsType = "ext4";
    options = ["defaults"];
  };

  networking.hostName = "nixserver";
}
