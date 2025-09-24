{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      wl-clipboard # Clipboard
      nix-output-monitor # Nice output when rebuilding
      nvd # Version diff after rebuilding
      unzip # Unzip utility
      gcc # Compiler
      sops
    ];
  };
}
