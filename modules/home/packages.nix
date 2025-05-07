{pkgs, ...}: {
  home.packages = with pkgs; [
    (import ./latex.nix {inherit pkgs;})
    (import ./website.nix {inherit pkgs;})
    pandoc
    fd

    # Applications
    feh # Image viewer
    zathura # PDF viewer
    obs-studio # Screenrecord
    vlc # Video viewer
  ];
  nixpkgs.config.allowUnfree = true;
}
