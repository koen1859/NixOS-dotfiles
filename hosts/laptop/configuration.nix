{
  imports = [
    ./modules/tlp.nix
  ];

  networking.hostName = "nixlaptop";

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
    options = ["defaults"];
  };

  services.upower.enable = true;
}
