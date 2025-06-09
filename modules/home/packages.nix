{pkgs, ...}: {
  home.packages = with pkgs; [
    (import ./scripts/latex.nix {inherit pkgs;})
    (import ./scripts/website.nix {inherit pkgs;})
    (import ./scripts/OneDrive.nix {inherit pkgs;})
    (import ./scripts/ProtonDrive.nix {inherit pkgs;})
    (import ./scripts/toggle_vpn.nix {inherit pkgs;})
    (import ./scripts/weather.nix {inherit pkgs;})
    tree
    libnotify
    timg
  ];

  programs = {
    feh.enable = true;
    fd.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
}
