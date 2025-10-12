{config, ...}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # boot = {
  #   initrd.kernelModules = ["nvidia"];
  #   kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
  #   extraModulePackages = [config.boot.kernelPackages.nvidiaPackages.stable];
  # };

  environment.variables = {
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "LIBVA_DRIVER_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "LIBGL_ALWAYS_INDIRECT" = "1";
  };

  hardware.graphics.enable = true;
}
