{
  self,
  inputs,
  withSystem,
  ...
}: let
  username = "koenstevens";
  wallpaper = ./wallpapers/wallhaven-8g5qr2_3440x1440.png;
  core = "${self}/modules/core";
  home = "${self}/modules/home";

  commonSpecialArgs = {
    inherit inputs username wallpaper core home;
  };
in {
  flake.homeConfigurations = {
    "${username}@nixlaptop" = withSystem "x86_64-linux" ({pkgs, ...}:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = commonSpecialArgs;
        modules = [
          ./hosts/laptop/home.nix
          home
          inputs.stylix.homeModules.stylix
          inputs.nvim-conf.homeModules.default
          inputs.sops-nix.homeManagerModules.sops
          inputs.nixcord.homeModules.nixcord
          inputs.mango.hmModules.mango
        ];
      });
    "${username}@nixpc" = withSystem "x86_64-linux" ({pkgs, ...}:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = commonSpecialArgs;
        modules = [
          ./hosts/pc/home.nix
          home
          inputs.stylix.homeModules.stylix
          inputs.nvim-conf.homeModules.default
          inputs.sops-nix.homeManagerModules.sops
          inputs.nixcord.homeModules.nixcord
          inputs.mango.hmModules.mango
        ];
      });
    "${username}@nixserver" = withSystem "x86_64-linux" ({pkgs, ...}:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = commonSpecialArgs;
        modules = [
          ./hosts/server/home.nix
          "${self}/modules/home/server.nix"
          inputs.stylix.homeModules.stylix
          inputs.nvim-conf.homeModules.default
          inputs.sops-nix.homeManagerModules.sops
        ];
      });
    "${username}@rpi5" = withSystem "aarch64-linux" ({pkgs, ...}:
      inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = commonSpecialArgs;
        modules = [
          ./hosts/rpi5/home.nix
          "${self}/modules/home/server.nix"
          inputs.stylix.homeModules.stylix
          inputs.nvim-conf.homeModules.default
          inputs.sops-nix.homeManagerModules.sops
        ];
      });
  };
}
