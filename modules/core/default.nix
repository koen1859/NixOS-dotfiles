{inputs, ...}: let
  core = "${inputs.self}/modules/core";
  inherit (import ../variables.nix) username;
in {
  imports = [
    "${core}/boot.nix"
    "${core}/environment.nix"
    "${core}/services.nix"
    "${core}/users.nix"
    "${core}/programs.nix"
    "${core}/stylix.nix"
    "${core}/network.nix"
    "${core}/nh.nix"
    "${core}/flatpak.nix"
  ];

  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "24.11";

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["root" "${username}"];
    };
  };

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {};
    };
    allowUnfree = true;
  };
}
