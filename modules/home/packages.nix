{pkgs, ...}: {
  home.packages = with pkgs; [
    (import ./scripts/latex.nix {inherit pkgs;})
    (import ./scripts/website.nix {inherit pkgs;})
    (import ./scripts/OneDrive.nix {inherit pkgs;})
    (import ./scripts/ProtonDrive.nix {inherit pkgs;})
    (import ./scripts/VPN_NL.nix {inherit pkgs;})
    (import ./scripts/VPN_Sui.nix {inherit pkgs;})
    pandoc # Filetype converter (html, pdf, ...)
    fd # Fuzzy finder

    # Applications
    feh # Image viewer
    zathura # PDF viewer
    proton-pass
    brave
  ];
  nixpkgs.config.allowUnfree = true;
}
