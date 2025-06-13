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
    nvf = {
      url = "github:notashelf/nvf";
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
    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nixvim,
    nvf,
    nixcord,
    nixarr,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
  in {
    packages.${system}.default =
      (nvf.lib.neovimConfiguration {
        inherit pkgs;
        modules = [./modules/home/nvf];
      }).neovim;

    nixosConfigurations = {
      nixlaptop = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/core
          ./hosts/laptop/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
      nixpc = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/core
          ./hosts/pc/configuration.nix
          stylix.nixosModules.stylix
        ];
      };
      nixserver = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/core/server.nix
          ./hosts/server/configuration.nix
          stylix.nixosModules.stylix
          nixarr.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      "${username}@nixlaptop" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home
          ./hosts/laptop/home.nix
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          inputs.nvf.homeManagerModules.default
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      "${username}@nixpc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home
          ./hosts/pc/home.nix
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          nvf.homeManagerModules.default
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      "${username}@nixserver" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home/server.nix
          ./hosts/server/home.nix
          stylix.homeModules.stylix
          nixvim.homeManagerModules.nixvim
          nvf.homeManagerModules.default
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {inherit inputs;};
      };
    };
  };
}
