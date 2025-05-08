{pkgs, ...}: {
  home.packages = with pkgs; [
    (import ./latex.nix {inherit pkgs;})
    (import ./website.nix {inherit pkgs;})
    pandoc # Filetype converter (html, pdf, ...)
    fd # Fuzzy finder

    # Applications
    feh # Image viewer
    zathura # PDF viewer
  ];
  nixpkgs.config.allowUnfree = true;
}
