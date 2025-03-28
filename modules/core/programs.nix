{pkgs, ...}: {
  programs = {
    hyprland.enable = true;
    nix-ld.enable = true;
    thunar.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
}
