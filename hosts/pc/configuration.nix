{
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
    ./modules/gaming.nix
  ];

  networking.hostName = "nixpc";
}
