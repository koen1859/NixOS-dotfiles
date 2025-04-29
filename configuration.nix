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
    ./modules/core/nixpkgs.nix
    ./modules/core/nix.nix
  ];

  system.stateVersion = "24.11";

}
