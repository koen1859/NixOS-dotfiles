{...}: {
  imports = [
    ./modules/home/hypr/hyprland.nix
    ./modules/home/animations.nix
    ./modules/home/keybindings.nix
    ./modules/home/windowrules.nix
    ./modules/home/waybar-ddubs.nix
    ./modules/home/wlogout/wlogout.nix
    ./modules/home/btop.nix
    ./modules/home/fastfetch.nix
    ./modules/home/git.nix
    ./modules/home/gtk.nix
    ./modules/home/htop.nix
    ./modules/home/kitty.nix
    ./modules/home/nvf.nix
    ./modules/home/qt.nix
    ./modules/home/shell.nix
    ./modules/home/starship.nix
    ./modules/home/stylix.nix
    ./modules/home/swaync.nix
    ./modules/home/tmux.nix
    ./modules/home/wofi.nix
    ./modules/home/zathura.nix
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";

    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
