{pkgs, ...}: {
  imports = [
    ./modules/home/hypr/hyprland.nix
    ./modules/home/hypr/animations.nix
    ./modules/home/hypr/keybindings.nix
    ./modules/home/hypr/windowrules.nix
    ./modules/home/hypr/hyprlock.nix
    ./modules/home/wlogout/wlogout.nix
    # Nixvim modules
    ./modules/home/nixvim
    # Other programs
    ./modules/home/btop.nix
    ./modules/home/fastfetch
    ./modules/home/git.nix
    ./modules/home/gtk.nix
    ./modules/home/htop.nix
    ./modules/home/kitty.nix
    ./modules/home/nixcord.nix
    ./modules/home/qt.nix
    ./modules/home/bash.nix
    ./modules/home/zsh/zsh.nix
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
  ];

  home = {
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    sessionVariables = {
      TEXMFHOME = "~/.texmf/";
    };
    stateVersion = "24.11";
    packages = [
      (import ./modules/home/latex.nix {inherit pkgs;})
    ];
  };
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
