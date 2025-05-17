{pkgs, ...}: {
  imports = [
    # ./llm.nix
    ./modules/hyprland.nix
  ];
  home.packages = with pkgs; [
    obs-studio # Screenrecord
    vlc # Video viewer
  ];
}
