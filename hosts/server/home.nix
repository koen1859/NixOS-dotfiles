{
  imports = [
    ./modules/hyprland.nix

    ../../modules/home/fetch
    ../../modules/home/firefox
    ../../modules/home/hypr
    ../../modules/home/nixvim
    ../../modules/home/wlogout
    ../../modules/home/zsh
    ../../modules/home/atuin.nix
    ../../modules/home/bash.nix
    ../../modules/home/btop.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/git.nix
    ../../modules/home/gtk.nix
    ../../modules/home/htop.nix
    ../../modules/home/kitty.nix
    ../../modules/home/librewolf.nix
    ../../modules/home/nixcord.nix
    ../../modules/home/packages.nix
    ../../modules/home/programming.nix
    ../../modules/home/qt.nix
    ../../modules/home/rofi.nix
    ../../modules/home/spicetify.nix
    ../../modules/home/starship.nix
    ../../modules/home/stylix.nix
    ../../modules/home/swaync.nix
    ../../modules/home/waybar.nix
    ../../modules/home/wezterm.nix
    ../../modules/home/wofi.nix
    ../../modules/home/zathura.nix
    ../../modules/home/zellij.nix
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    sessionVariables = {
    };
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
