{
  imports = [
    ./modules/hardware.nix
    ./modules/nvidia.nix
    ./modules/ssh.nix
    ./modules/gaming.nix
    ./modules/virtualization.nix
  ];

  networking.hostName = "nixpc";
}
