{pkgs, ...}: {
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    yazi.enable = true;
    thunar.enable = true;
    hyprland.enable = true;
    mango.enable = true;
    niri.enable = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [xwayland-satellite];
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common = {
        default = ["hyprland" "wlr"];
      };
    };
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };
}
