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
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nixcord,
    nvim-conf,
    auto-cpufreq,
    sops-nix,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    username = "koenstevens";
    theme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    wallpaper = ./wallpapers/gruvbox_painting.png;
    core = "${self}/modules/core";
    home = "${self}/modules/home";
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
            hostConfig
            stylix.nixosModules.stylix
            sops-nix.nixosModules.sops
          ]
          ++ extraModules;
      };

    mkHome = name: hostHome: extraModules:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules =
          [
            hostHome
            stylix.homeModules.stylix
            nvim-conf.homeModules.default
            inputs.sops-nix.homeManagerModules.sops
          ]
          ++ extraModules;
        extraSpecialArgs = commonSpecialArgs;
      };
  in {
    nixosConfigurations = {
      nixlaptop = mkHost "nixlaptop" ./hosts/laptop/configuration.nix [
        core
        auto-cpufreq.nixosModules.default
      ];
      nixpc = mkHost "nixpc" ./hosts/pc/configuration.nix [core];
      nixserver = mkHost "nixserver" ./hosts/server/configuration.nix ["${self}/modules/core/server.nix"];
    };

    homeConfigurations = {
      "${username}@nixlaptop" = mkHome "nixlaptop" ./hosts/laptop/home.nix [
        home
        nixcord.homeModules.nixcord
      ];
      "${username}@nixpc" = mkHome "nixpc" ./hosts/pc/home.nix [
        home
        nixcord.homeModules.nixcord
      ];
      "${username}@nixserver" = mkHome "nixserver" ./hosts/server/home.nix ["${self}/modules/home/server.nix"];
    };
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        pkg-config
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        fontconfig
        freetype
        harfbuzz
        gcc
        gnumake
      ];
    };
  };
}
