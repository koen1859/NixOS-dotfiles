{pkgs, ...}: {
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    sessionVariables = {
      nixos_ozone_wl = "1";
      NH_FLAKE = "/home/koenstevens/.dotfiles/";
    };
    systemPackages = with pkgs; [
      # Core packages
      hyprland # WM
      ghostty # Terminal
      kitty # Terminal
      wl-clipboard # Clipboard
      git # Version control
      brightnessctl # Change laptop brightness
      nix-ld # Make nix pkgs
      greetd.tuigreet # Display manager
      flatpak # Flatpak apps

      # File managers
      yazi
      xfce.thunar

      # Some utilities
      unzip
      nh # Nix helper
      nix-output-monitor # Nice output when rebuilding
      nvd # Version diff after rebuilding
      wofi # App launcher
      hyprlock # Lockscreen
      hyprshot # Screenshot util
      wlogout # Logout util
      waybar # Top Bar
      swaynotificationcenter # Get desktop notifications
      networkmanagerapplet # Network applet
      blueman # Bluetooth applet
      fastfetch # Fetch app
      onefetch # Fetch for git repo
      microfetch # Faster fetch
      timg # Terminal image viewer
      rclone # Mount cloud in filesystem
      imagemagick # Image tool
      htop # Better top
      btop # Even better top
      libnotify # For notify-send cmd
      pavucontrol # Audio control
      lsd # Better ls
      zellij # Terminal multiplexer
      feh # Image viewer
      bat # Better cat
      devenv # Make nice dev shells
      direnv # Activate shells on directory level

      # Browsers
      firefox
      librewolf
      brave

      # Applications
      zathura # PDF viewer
      bitwarden-desktop # Password manager
      spotify # Music
      spicetify-cli # Better spotify
      obs-studio # Screenrecord
      vlc # Video viewer
      vesktop # Discord app

      # Programming languages
      python3
      (rWrapper.override {
        # Download LSP for it to work with nixvim
        packages = with rPackages; [
          languageserver
          languageserversetup
        ];
      })

      # Theming
      bibata-cursors
      papirus-icon-theme
      base16-schemes
    ];
  };
}
