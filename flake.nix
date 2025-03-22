{

  description = "Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixlaptop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            stylix.nixosModules.stylix
            ./hosts/laptop.nix
          ];
        };
        nixpc = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/pc.nix
            stylix.nixosModules.stylix
          ];
        };
      };
      homeConfigurations = {
        koenstevens = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix stylix.homeManagerModules.stylix ];
        };
      };
    };

}
