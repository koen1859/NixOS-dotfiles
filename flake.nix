{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    stylix = {
      url = "github:danth/stylix";
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
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-grub-themes = {
      url = "github:jeslie0/nixos-grub-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nixvim,
    nixcord,
    nixarr,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      nixlaptop = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/laptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
      nixpc = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/pc/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
      nixserver = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/server/configuration.nix
          stylix.nixosModules.stylix
          nixarr.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      "koenstevens@nixlaptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/laptop/home.nix
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      "koenstevens@nixpc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/pc/home.nix
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      "koenstevens@nixserver" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/server/home.nix
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
    };
  };
}
