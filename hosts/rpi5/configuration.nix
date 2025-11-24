{
  imports = [
    ./modules/hardware-configuration.nix
    ./modules/ssh.nix
  ];
  networking.hostName = "rpi5";
  nixpkgs.config.allowUnsupportedSystem = true;
}
