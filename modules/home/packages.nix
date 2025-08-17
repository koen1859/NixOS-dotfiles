{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    tree
    libnotify
    timg
    typst
    mullvad-browser
    signal-desktop
    proton-pass
    protonmail-desktop

    inputs.nvim-conf.packages.${pkgs.system}.default
  ];

  programs = {
    fd.enable = true;
    feh.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
