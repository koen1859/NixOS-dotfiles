{pkgs, ...}: {
  environment = {
    sessionVariables = {
      nixos_ozone_wl = "1";
    };
    systemPackages = with pkgs; [
      wl-clipboard # Clipboard
      nix-output-monitor # Nice output when rebuilding
      nvd # Version diff after rebuilding
      unzip # Unzip utility
      gcc # C/C++ compiler
      wireguard-tools # VPN
    ];
  };
}
