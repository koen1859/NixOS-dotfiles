{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    radarr
    sonarr
  ];
}
