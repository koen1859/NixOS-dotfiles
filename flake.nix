{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-conf = {
      url = "gitlab:koenstevens/nvim-conf";
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
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    nixcord,
    nvim-conf,
    auto-cpufreq,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username;
  in {
    nixosConfigurations = {
      nixlaptop = lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/core
          ./hosts/laptop/configuration.nix
          stylix.nixosModules.stylix
          auto-cpufreq.nixosModules.default
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
          ./modules/core
          ./hosts/server/configuration.nix
          stylix.nixosModules.stylix
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
          nixcord.homeModules.nixcord
          nvim-conf.homeModules.default
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      "${username}@nixpc" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home
          ./hosts/pc/home.nix
          stylix.homeModules.stylix
          nixcord.homeModules.nixcord
          nvim-conf.homeModules.default
        ];
        extraSpecialArgs = {inherit inputs;};
      };
      "${username}@nixserver" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./modules/home
          ./hosts/server/home.nix
          stylix.homeModules.stylix
          nixcord.homeModules.nixcord
          nvim-conf.homeModules.default
        ];
        extraSpecialArgs = {inherit inputs;};
      };
    };
  };
}
