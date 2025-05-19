{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qbittorrent
    jellyfin
    radarr
    sonarr
  ];
}
