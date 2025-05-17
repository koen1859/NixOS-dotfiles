{
  imports = [
    ./modules/hardware.nix
    ./modules/tlp.nix

    ../../modules/core/bootloader.nix
    ../../modules/core/environment.nix
    ../../modules/core/services.nix
    ../../modules/core/fonts.nix
    ../../modules/core/users.nix
    ../../modules/core/programs.nix
    ../../modules/core/misc.nix
    ../../modules/core/stylix.nix
    ../../modules/core/network.nix
    ../../modules/core/nixpkgs.nix
    ../../modules/core/nix.nix
    ../../modules/core/flatpak.nix
  ];

  system.stateVersion = "24.11";

  networking.hostName = "nixlaptop";

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
    options = ["defaults"];
  };
}
