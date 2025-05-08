{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    steam
    gamescope
    vulkan-loader
    vulkan-tools
    heroic
    mangohud
    prismlauncher
  ];
  services.udev.packages = with pkgs; [steamPackages.steam];
  boot.kernelModules = ["hid_sony"];
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
}
