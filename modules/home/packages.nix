{pkgs, ...}: {
  home.packages = with pkgs; [
    (import ./scripts/latex.nix {inherit pkgs;})
    (import ./scripts/website.nix {inherit pkgs;})
    (import ./scripts/OneDrive.nix {inherit pkgs;})
    (import ./scripts/ProtonDrive.nix {inherit pkgs;})
    (import ./scripts/toggle_vpn.nix {inherit pkgs;})
    (import ./scripts/BSc_Thesis.nix {inherit pkgs;})
    pandoc # Filetype converter (html, pdf, ...)
    fd # Fuzzy finder

    # Applications
    feh # Image viewer
    zathura # PDF viewer
    lazygit # Git UI
  ];
  nixpkgs.config.allowUnfree = true;
}
