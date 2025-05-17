{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git # Version control
    nix-ld # Make nix pkgs
    nh # Nix helper
    nix-output-monitor # Nice output when rebuilding
    nvd # Version diff after rebuilding
    yazi # Fast terminal file manager
    unzip # Unzip utility
    gcc # C/C++ compiler
    wireguard-tools
  ];
}
