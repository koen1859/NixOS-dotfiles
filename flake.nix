{
  description = "Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixlaptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/laptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
      nixpc = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/pc/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
      laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./hosts/laptop/home.nix
          stylix.homeManagerModules.stylix
          nvf.homeManagerModules.default
        ];
      };
      pc = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./hosts/pc/home.nix
          stylix.homeManagerModules.stylix
          nvf.homeManagerModules.default
        ];
      };
    };
  };
}
