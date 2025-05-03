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
      unzip # Unzip utility

      # Applications
      feh # Image viewer
      zathura # PDF viewer
      obs-studio # Screenrecord
      vlc # Video viewer
    ];
  };
}
