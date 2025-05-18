{pkgs, ...}: {
  home.packages = with pkgs; [
    obs-studio # Screenrecord
    vlc # Video viewer
  ];
}
