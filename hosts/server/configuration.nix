{
  imports = [
    ./modules/nvidia.nix
    ./modules/ssh.nix
  ];

  networking.hostName = "nixserver";
}
