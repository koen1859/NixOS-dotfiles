{
  imports = [
    ./modules/nvidia.nix
    ./modules/hardware.nix
    ./modules/ssh.nix
    ./modules/webserver.nix
  ];

  networking.hostName = "nixserver";
}
