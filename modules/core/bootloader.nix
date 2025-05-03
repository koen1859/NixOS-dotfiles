{pkgs, ...}: let
  inherit (import ../../wallpaper.nix) wallpaper;
in {
  boot = {
    loader = {
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
