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
          src = ./dwm;
        };
      };
    };
    picom.enable = true;
  };
}
