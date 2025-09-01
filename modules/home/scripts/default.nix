{pkgs, ...}: {
  home.packages = [
    (import ./latex.nix {inherit pkgs;})
    (import ./website.nix {inherit pkgs;})
    (import ./OneDrive.nix {inherit pkgs;})
    (import ./ProtonDrive.nix {inherit pkgs;})
    (import ./toggle_vpn.nix {inherit pkgs;})
    (import ./weather.nix {inherit pkgs;})
  ];
}
