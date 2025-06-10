{pkgs, ...}: {
  programs = {
    nix-ld = {
      enable = true;
    };
    zsh.enable = true;
    yazi.enable = true;
    thunar.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}
