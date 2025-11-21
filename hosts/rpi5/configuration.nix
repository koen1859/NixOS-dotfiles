{
  imports = [
    ./modules/hardware-configuration.nix
  ];
  networking.hostName = "rpi5";
  nixpkgs.config.allowUnsupportedSystem = true;
}
