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
      unzip
      hyprland
      kitty
      wl-clipboard
      git
      brightnessctl
      blueman
      nix-ld
      greetd.tuigreet
      flatpak
      ghostty

      # File managers
      yazi
      xfce.thunar

      # Some utilities
      nh
      nix-output-monitor
      nvd
      wofi
      hyprlock
      hyprshot
      wlogout
      waybar
      swaynotificationcenter
      networkmanagerapplet
      fastfetch
      onefetch
      microfetch
      timg
      rclone
      starship
      atuin
      imagemagick
      btop
      htop
      openvpn
      libnotify
      pavucontrol
      speedtest-cli
      lsd
      ripgrep
      zellij
      yq
      entr
      pandoc
      feh
      bat
      devenv
      direnv

      # Browsers
      firefox
      librewolf
      brave

      # Applications
      zathura
      bitwarden-desktop
      spotify
      spicetify-cli
      obs-studio
      vlc
      gimp
      vesktop

      # Programming languages
      python3
      R

      # Theming
      bibata-cursors
      papirus-icon-theme
      base16-schemes
    ];
  };
}
