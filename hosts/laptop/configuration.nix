{
  imports = [
    ./modules/tlp.nix
    ./modules/auto-cpufreq.nix
    ./modules/hardware.nix
    ./modules/gaming.nix
    ./modules/boot.nix
  ];

  networking.hostName = "nixlaptop";

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
    options = ["defaults"];
  };
}
