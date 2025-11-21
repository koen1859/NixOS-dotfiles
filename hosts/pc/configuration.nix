{
  imports = [
    ./modules/nvidia.nix
    ./modules/hardware.nix
    ./modules/ssh.nix
    ./modules/gaming.nix
    # ./modules/virtualization.nix
    ./modules/boot.nix
  ];

  networking.hostName = "nixpc";
}
