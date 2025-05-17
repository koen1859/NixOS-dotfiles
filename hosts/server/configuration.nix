{
  imports = [
    ./modules/ssh.nix
  ];

  system.stateVersion = "24.11";

  networking.hostName = "nixserver";
}
