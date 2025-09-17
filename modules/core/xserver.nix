{
  wallpaper,
  pkgs,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      autoRepeatDelay = 200;
      autoRepeatInterval = 35;
      displayManager.sessionCommands = ''
        xwallpaper --zoom ${wallpaper}
      '';
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = ./config/dwm;
        };
      };
    };
    picom.enable = true;
  };
}
