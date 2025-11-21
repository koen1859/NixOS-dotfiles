{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    libnotify
    timg
    typst
    signal-desktop
    proton-pass
    protonmail-desktop
    onlyoffice-desktopeditors
    onefetch
  ];

  programs = {
    fd.enable = true;
    feh.enable = true;
    nvim-conf.enable = true;
    ripgrep.enable = true;
    fzf.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
