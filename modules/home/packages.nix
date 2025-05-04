{pkgs, ...}: {
  home.packages = with pkgs; [
    pandoc
    (import ./latex.nix {inherit pkgs;})
    (import ./website.nix {inherit pkgs;})
  ];
  nixpkgs.config.allowUnfree = true;
}
