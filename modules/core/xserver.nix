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
        ${pkgs.xwallpaper}/bin/xwallpaper --zoom ${wallpaper}
        setxkbmap -option caps:escape
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
  environment.systemPackages = with pkgs; [
    (pkgs.st.overrideAttrs (_: {
      src = ./st;
      patches = [];
    }))
    (pkgs.dmenu.overrideAttrs (_: {
      src = ./dmenu;
      patches = [];
    }))
  ];
}
