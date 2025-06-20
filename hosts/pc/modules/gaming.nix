{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  environment.systemPackages = [
    pkgs.vulkan-loader
    pkgs.vulkan-tools
    pkgs.heroic
    pkgs.mangohud
    pkgs.prismlauncher
    pkgs.lutris
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
