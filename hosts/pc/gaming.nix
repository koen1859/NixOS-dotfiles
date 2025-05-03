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
