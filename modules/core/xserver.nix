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
      inputClassSections = [
        ''
          Identifier "Trust Mouse - Disable Accel"
          MatchProduct "INSTANT Trust GXT 922 Gaming Mouse"
          Option "AccelerationProfile" "-1"
          Option "AccelerationScheme" "none"
          Option "AccelerationNumerator" "0"
          Option "AccelerationDenominator" "1"
          Option "AccelerationThreshold" "1"
        ''
      ];
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs {
          src = ./dwm;
        };
        extraSessionCommands = ''
          slstatus &
        '';
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
    (pkgs.slstatus.overrideAttrs (_: {
      src = ./slstatus;
      patches = [];
    }))
    xclip
  ];
}
