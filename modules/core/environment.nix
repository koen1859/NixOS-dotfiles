{pkgs, ...}: {
  environment = {
    shells = with pkgs; [
      bash
      zsh
    ];
    sessionVariables = {
      nixos_ozone_wl = "1";
    };
    systemPackages = with pkgs; [
      # Core packages
      wl-clipboard # Clipboard
      nh # Nix helper
      nix-output-monitor # Nice output when rebuilding
      nvd # Version diff after rebuilding
      unzip # Unzip utility
      gcc # C/C++ compiler
      wireguard-tools
      libsForQt5.qt5.qtgraphicaleffects
    ];
  };
}
