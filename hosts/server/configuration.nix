{
  imports = [
    ./modules/ssh.nix
    ./modules/packages.nix
  ];

  system.stateVersion = "24.11";

  networking.hostName = "nixserver";
}
