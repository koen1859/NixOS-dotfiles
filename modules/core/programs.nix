{pkgs, ...}: {
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    yazi.enable = true;
    thunar.enable = true;
    hyprland.enable = true;
    niri.enable = true;
  };
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = ["hyprland"];
      };
    };
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}
