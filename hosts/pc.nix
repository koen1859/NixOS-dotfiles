{ config, pkgs, ... }:

{
  imports = [
    ../pc-hardware.nix
  ];
  networking.hostName = "nixpc";

  environment.systemPackages = with pkgs; [
    steam
    gamescope
  ];


  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;

    #prime = {
    #  offload.enable = true;
    #  offload.enableOffloadCmd = true;
    #};
  };

  boot.initrd.kernelModules = [ "nvidia" ];
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidiaPackages.latest ];

  environment.variables = {
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "LIBVA_DRIVER_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
  };
}
