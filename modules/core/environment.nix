{pkgs, ...}: {
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    sessionVariables = {
      nixos_ozone_wl = "1";
      TEXMFHOME = "~/.texmf";
    };
    systemPackages = with pkgs; [
      # Core packages
      cmake
      gnumake
      unzip
      wget
      hyprland
      kitty
      wl-clipboard
      git
      gcc
      brightnessctl
      blueman
      nix-ld
      glibc
      greetd.tuigreet

      # File managers
      fzf
      yazi
      fd
      xfce.thunar
      flatpak

      # Some utilities
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

      # Programming languages / database / LSP / LaTeX
      python3
      R
      postgresql_17
      postgresql17Packages.postgis
      ltex-ls
      # texliveFull

      # Theming
      bibata-cursors
      papirus-icon-theme
      base16-schemes
    ];
  };
}
