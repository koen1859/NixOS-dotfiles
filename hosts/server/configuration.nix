{
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
  ];

  networking.hostName = "nixserver";
}
