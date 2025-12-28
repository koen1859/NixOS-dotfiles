{
  imports = [
    ./modules/nvidia.nix
    ./modules/hardware.nix
    ./modules/ssh.nix
    ./modules/gaming.nix
    ./modules/boot.nix
    ./modules/virtualization.nix
  ];

  networking.hostName = "nixpc";
}
