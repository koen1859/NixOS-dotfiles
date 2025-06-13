{
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
    ./modules/nixarr.nix
    # ./modules/packages.nix
    # ./modules/services.nix
  ];

  networking.hostName = "nixserver";
}
