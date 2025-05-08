{pkgs, ...}: {
  imports = [
    # ./llm.nix
    ./hyprland.nix
  ];
  home.packages = with pkgs; [
    obs-studio # Screenrecord
    vlc # Video viewer
  ];
}
