{
  self,
  inputs,
  ...
}: let
  username = "koenstevens";
  wallpaper = ./wallpapers/wallhaven-8g5qr2_3440x1440.png;
  core = "${self}/modules/core";
  home = "${self}/modules/home";
  nixos-raspberrypi = inputs.nixos-raspberrypi;

  commonSpecialArgs = {
    inherit inputs username wallpaper core home nixos-raspberrypi;
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
          inputs.noctalia.nixosModules.default
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
          inputs.noctalia.nixosModules.default
        ];
      };
      nixserver = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = commonSpecialArgs;
        modules = [
          ./hosts/server/configuration.nix
          "${self}/modules/core/server.nix"
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops
        ];
      };
      rpi5 = inputs.nixos-raspberrypi.lib.nixosSystemFull {
        specialArgs = commonSpecialArgs;
        modules = [
          ./hosts/rpi5/configuration.nix
          "${self}/modules/core/server.nix"
          inputs.stylix.nixosModules.stylix
          inputs.sops-nix.nixosModules.sops

          inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
          inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.display-vc4
        ];
      };
    };
  };
}
