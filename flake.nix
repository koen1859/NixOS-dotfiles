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
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
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

    username = "koenstevens";
    theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    wallpaper = ./wallpapers/solar_system.png;
    core = "${inputs.self}/modules/core";
    home = "${inputs.self}/modules/home";
    shell = pkgs.zsh;

    commonSpecialArgs = {
      inherit inputs username theme wallpaper core home shell;
    };

    mkHost = name: hostConfig: extraModules:
      lib.nixosSystem {
        inherit system;
        specialArgs = commonSpecialArgs;
        modules =
          [
            core
            hostConfig
            stylix.nixosModules.stylix
          ]
          ++ extraModules;
      };

    mkHome = name: hostHome:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          home
          hostHome
          stylix.homeModules.stylix
          nixcord.homeModules.nixcord
          nvim-conf.homeModules.default
        ];
        extraSpecialArgs = commonSpecialArgs;
      };
  in {
    nixosConfigurations = {
      nixlaptop = mkHost "nixlaptop" ./hosts/laptop/configuration.nix [
        auto-cpufreq.nixosModules.default
      ];

      nixpc = mkHost "nixpc" ./hosts/pc/configuration.nix [];

      nixserver = mkHost "nixserver" ./hosts/server/configuration.nix [];
    };

    homeConfigurations = {
      "${username}@nixlaptop" = mkHome "nixlaptop" ./hosts/laptop/home.nix;
      "${username}@nixpc" = mkHome "nixpc" ./hosts/pc/home.nix;
      "${username}@nixserver" = mkHome "nixserver" ./hosts/server/home.nix;
    };
  };
}
