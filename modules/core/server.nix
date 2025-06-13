{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) username core;
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
  ];
  time.timeZone = "Europe/Amsterdam";
  i18n.defaultLocale = "en_US.UTF-8";

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

  system.stateVersion = "24.11";
}
