{
  imports = [
    ./modules/nvidia.nix
    ./modules/hardware.nix
    ./modules/ssh.nix
    ./modules/webserver.nix
    ./modules/git.nix
  ];

  networking.hostName = "nixserver";
}
