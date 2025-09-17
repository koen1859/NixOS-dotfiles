{pkgs, ...}: {
  home.packages = [
    (import ./latex.nix {inherit pkgs;})
    (import ./OneDrive.nix {inherit pkgs;})
    (import ./ProtonDrive.nix {inherit pkgs;})
    (import ./toggle_vpn.nix {inherit pkgs;})
    (import ./weather.nix {inherit pkgs;})
    (import ./next_workspace.nix {inherit pkgs;})
    (import ./previous_workspace.nix {inherit pkgs;})
  ];
}
