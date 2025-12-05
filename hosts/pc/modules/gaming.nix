{
  username,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-tools
    heroic
    mangohud
    prismlauncher
    lutris
  ];

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      platformOptimizations.enable = true;
    };
    gamemode.enable = true;
  };
}
