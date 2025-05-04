{pkgs, ...}: {
  home.packages = with pkgs; [
    pandoc
    (import ./modules/home/latex.nix {inherit pkgs;})
    (import ./modules/home/website.nix {inherit pkgs;})
  ];
  nixpkgs.config.allowUnfree = true;
}
