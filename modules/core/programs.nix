{pkgs, ...}: {
  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    yazi.enable = true;
    thunar.enable = true;
    hyprland.enable = false;
    mango.enable = true;
    niri.enable = false;
    xwayland.enable = true;
    regreet.enable = false;
  };
  environment.systemPackages = with pkgs; [xwayland-satellite];
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common = {
        default = ["wlr"];
      };
    };
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
  };
}
