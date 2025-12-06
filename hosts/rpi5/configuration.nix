{
  imports = [
    ./modules/hardware-configuration.nix
    ./modules/ssh.nix
    ./modules/adguard.nix
    ./modules/osrm.nix
    ./modules/webserver.nix
    ./modules/searxng.nix
    ./modules/git.nix
  ];
  networking.hostName = "rpi5";
  nixpkgs.config.allowUnsupportedSystem = true;
}
