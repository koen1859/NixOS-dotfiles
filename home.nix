{pkgs, ...}: {
  imports = [
    ./modules/home/hypr
    ./modules/home/nixvim
    ./modules/home/fetch
    ./modules/home/wlogout
    ./modules/home/zsh
    ./modules/home/btop.nix
    ./modules/home/git.nix
    ./modules/home/gtk.nix
    ./modules/home/htop.nix
    ./modules/home/kitty.nix
    ./modules/home/nixcord.nix
    ./modules/home/qt.nix
    ./modules/home/bash.nix
    ./modules/home/starship.nix
    ./modules/home/stylix.nix
    ./modules/home/swaync.nix
    ./modules/home/wofi.nix
    ./modules/home/waybar.nix
    ./modules/home/zathura.nix
    ./modules/home/zellij.nix
    ./modules/home/librewolf.nix
    ./modules/home/spicetify.nix
    ./modules/home/zen.nix
    ./modules/home/ghostty.nix
    ./modules/home/programming.nix
    ./modules/home/packages.nix
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    sessionVariables = {
      TEXMFHOME = "~/.texmf/";
    };
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
