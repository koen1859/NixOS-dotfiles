{ config, pkgs, ... }:

{
  networking.hostName = "nixpc";

  environment.systemPackages = with pkgs; [
    tlp
  ];


  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
    };
  };

  boot.initrd.kernelModules = [ "nvidia" ];
  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidiaPackages.latest ];

  services.xserver.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;

  environment.variables = {
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "LIBVA_DRIVER_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
  };
}
