{pkgs, ...}: {
  imports = [
    ./modules/hardware.nix
    ./modules/boot.nix
  ];

  networking.hostName = "nixlaptop";
  networking.networkmanager.enable = true;

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
    options = ["defaults"];
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
