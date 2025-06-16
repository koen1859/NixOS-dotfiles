{
  pkgs,
  inputs,
  ...
}: {
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
    typst
    ncdu
    ladybird

    inputs.nvim-conf.packages.${pkgs.system}.default
  ];

  nixpkgs.config.allowUnfree = true;
}
