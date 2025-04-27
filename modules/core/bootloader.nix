{pkgs, ...}: let
  inherit (import ../../wallpaper.nix) wallpaper;
in {
  boot = {
    loader = {
      grub = {
        enable = false;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        gfxmodeEfi = "1920x1080";
      };

      limine = {
        enable = false;
        maxGenerations = 5;
        style = {
          wallpapers = [wallpaper];
          interface.resolution = "1920x1080";
        };
      };

      systemd-boot = {
        enable = true;
        configurationLimit = 5;
        consoleMode = "max";
      };
      timeout = 30;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["quit" "splash"];
  };
}
