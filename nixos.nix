{
  self,
  inputs,
  ...
}: let
  username = "koenstevens";
  wallpaper = ./wallpapers/a_road_surrounded_by_trees.jpg;
  core = "${self}/modules/core";
  home = "${self}/modules/home";

  commonSpecialArgs = {
    inherit inputs username wallpaper core home;
  };
in {
  flake = {
    nixosConfigurations = {
      nixlaptop = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = commonSpecialArgs;
        modules = [
          ./hosts/laptop/configuration.nix
          core
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          inputs.auto-cpufreq.nixosModules.default
          inputs.mango.nixosModules.mango
        ];
      };
      nixpc = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = commonSpecialArgs;
        modules = [
          ./hosts/pc/configuration.nix
          core
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          inputs.mango.nixosModules.mango
        ];
      };
      nixserver = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = commonSpecialArgs;
        modules = [
          ./hosts/server/configuration.nix
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
          "${self}/modules/core/server.nix"
        ];
      };
    };
  };
}
