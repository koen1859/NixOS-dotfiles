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
    brightnessctl
    quickshell
    obs-studio
    pipewire
    vlc
    kdePackages.kdenlive
  ];

  programs = {
    fd.enable = true;
    feh.enable = true;
    nvim-conf.enable = true;
    ripgrep.enable = true;
    fzf.enable = true;
    foot.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
