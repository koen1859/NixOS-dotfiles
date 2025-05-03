{
  imports = [
    ./hardware.nix
    ./nvidia.nix
    ./ssh.nix
    ./gaming.nix
  ];

  networking.hostName = "nixpc";

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/sda1";
    fsType = "ext4";
    options = ["defaults"];
  };
}
