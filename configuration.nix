_: {
  imports = [
    ./modules/core/bootloader.nix
    ./modules/core/environment.nix
    ./modules/core/services.nix
    ./modules/core/fonts.nix
    ./modules/core/flatpak.nix
    ./modules/core/users.nix
    ./modules/core/programs.nix
    ./modules/core/misc.nix
    ./modules/core/stylix.nix
    ./modules/core/network.nix
  ];

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {};
    };
    allowUnfree = true;
  };

  system.stateVersion = "24.11";

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  programs.nix-ld.enable = true;
}
