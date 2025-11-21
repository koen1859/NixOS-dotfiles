{config, ...}: {
  imports = [
    ./configtxt.nix
  ];
  services.udev.extraRules = ''
    ENV{ID_PART_ENTRY_SCHEME}=="gpt", \
      ENV{ID_PART_ENTRY_FLAGS}=="0x1", \
      ENV{UDISKS_IGNORE}="1"
  '';
  system.nixos.tags = [
    "raspberry-pi-${config.boot.loader.raspberryPi.variant}"
    config.boot.loader.raspberryPi.bootloader
    config.boot.kernelPackages.kernel.version
  ];
  fileSystems = {
    "/boot/firmware" = {
      device = "/dev/disk/by-label/FIRMWARE";
      fsType = "vfat";
      options = [
        "noatime"
        "noauto"
        "x-systemd.automount"
        "x-systemd.idle-timeout=1min"
      ];
    };
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = ["noatime"];
    };
  };
  boot.tmp.useTmpfs = true;
}
