{pkgs, ...}: {
  programs = {
    zsh.enable = true;
    nix-ld = {
      enable = true;
    };
    yazi.enable = true;
    thunar.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}
