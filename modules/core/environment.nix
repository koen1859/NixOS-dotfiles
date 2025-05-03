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
      wl-clipboard # Clipboard
      git # Version control
      nix-ld # Make nix pkgs
      greetd.tuigreet # Display manager
      flatpak # Flatpak apps
      nh # Nix helper
      nix-output-monitor # Nice output when rebuilding
      nvd # Version diff after rebuilding
      yazi # Fast terminal file manager
      timg # Terminal image viewer
      unzip

      # Some utilities
      htop # Better top
      lsd # Better ls
      zellij # Terminal multiplexer
      bat # Better cat
      devenv # Make nice dev shells
      direnv # Activate shells on directory level

      # Applications
      feh # Image viewer
      zathura # PDF viewer
      obs-studio # Screenrecord
      vlc # Video viewer

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
    ];
  };
}
