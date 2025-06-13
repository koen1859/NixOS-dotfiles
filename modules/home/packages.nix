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

    (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [./nvf];
    }).neovim
  ];

  programs = {
    feh.enable = true;
    fd.enable = true;
  };
  nixpkgs.config.allowUnfree = true;
}
