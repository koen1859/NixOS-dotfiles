{...}: {
  imports = [
    ./modules/home/hypr/hyprland.nix
    ./modules/home/hypr/animations.nix
    ./modules/home/hypr/keybindings.nix
    ./modules/home/hypr/windowrules.nix
    ./modules/home/wlogout/wlogout.nix
    ./modules/home/btop.nix
    ./modules/home/fastfetch.nix
    ./modules/home/git.nix
    ./modules/home/gtk.nix
    ./modules/home/htop.nix
    ./modules/home/kitty.nix
    ./modules/home/nvf.nix
    ./module/home/vimPlugins.nix
    ./modules/home/qt.nix
    ./modules/home/shell.nix
    ./modules/home/starship.nix
    ./modules/home/stylix.nix
    ./modules/home/swaync.nix
    ./modules/home/tmux.nix
    ./modules/home/wofi.nix
    ./modules/home/waybar.nix
    ./modules/home/zathura.nix
    ./modules/home/zellij.nix
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";

    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
