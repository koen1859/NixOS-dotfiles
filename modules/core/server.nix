{
  core,
  username,
  ...
}: {
  imports = [
    "${core}/environment.nix"
    "${core}/users.nix"
    "${core}/stylix.nix"
    "${core}/nh.nix"
    "${core}/sops.nix"
  ];

  programs = {
    zsh.enable = true;
    yazi.enable = true;
  };

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
    allowUnfree = true;
  };
  hardware.graphics.enable = true;
}
