{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
    # ../../modules/core/virtualisation.nix
  ];
  networking.hostName = "nixpc";

  environment.systemPackages = with pkgs; [
    steam
    gamescope
    vulkan-loader
    vulkan-tools
    heroic
    ollama-cuda
    (alpaca.override
      {
        ollama = ollama-cuda;
      })
    mangohud
    prismlauncher
  ];

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  services = {
    xserver.videoDrivers = ["nvidia"];

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
        Port = 2222;
      };
    };
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [2222];
  };

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

  boot = {
    kernelPackages = pkgs.linuxPackages;
    initrd.kernelModules = ["nvidia"];
    kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
    extraModulePackages = [config.boot.kernelPackages.nvidiaPackages.latest];
  };

  environment.variables = {
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "LIBVA_DRIVER_NAME" = "nvidia";
    "WLR_NO_HARDWARE_CURSORS" = "1";
    "LIBGL_ALWAYS_INDIRECT" = "1";
  };

  hardware.graphics.enable = true;

  fileSystems."/home/koenstevens/secondary_storage" = {
    device = "/dev/sda1";
    fsType = "ext4";
    options = ["defaults"];
  };
}
