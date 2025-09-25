{
  imports = [
    ./modules/nvidia.nix
    ./modules/hardware.nix
    ./modules/ssh.nix
    ./modules/webserver.nix
    ./modules/git.nix
    ./modules/osrm.nix
    ./modules/searxng.nix
  ];

  networking.hostName = "nixserver";
}
