{
  description = "Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    nixvim,
    spicetify-nix,
    nixcord,
    ...
  } @ inputs: let
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
          nixvim.homeManagerModules.nixvim
          nixcord.homeManagerModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      pc = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./hosts/pc/home.nix
          stylix.homeManagerModules.stylix
          nvf.homeManagerModules.default
          nixvim.homeManagerModules.nixvim
          nixcord.homeManagerModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
    };
  };
}
