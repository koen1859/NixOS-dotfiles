{pkgs, ...}: {
  home.packages = with pkgs; [
    tree
    libnotify
    timg
    typst
    mullvad-browser
    signal-desktop
    proton-pass
    protonmail-desktop
    onlyoffice-desktopeditors
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
