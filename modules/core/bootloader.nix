{pkgs, ...}: let
  inherit (import ../../wallpaper.nix) wallpaper;
in {
  boot = {
    loader = {
      systemd-boot = {
        enable = false;
        configurationLimit = 5;
        consoleMode = "max";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        splashImage = wallpaper;
      };
      timeout = 30;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["quit" "splash"];
  };
}
