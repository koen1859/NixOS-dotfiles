{inputs, ...}: let
  inherit (import ../variables.nix {inherit inputs pkgs;}) home username;
in {
  imports = [
    "${home}/eww"
    "${home}/fetch"
    "${home}/firefox"
    "${home}/hypr"
    "${home}/wlogout"
    "${home}/wezterm"
    "${home}/zsh"
    "${home}/atuin.nix"
    "${home}/bash.nix"
    "${home}/btop.nix"
    "${home}/chromium.nix"
    "${home}/ghostty.nix"
    "${home}/git.nix"
    "${home}/htop.nix"
    "${home}/kitty.nix"
    "${home}/latex.nix"
    "${home}/librewolf.nix"
    "${home}/nixcord.nix"
    "${home}/packages.nix"
    "${home}/programming.nix"
    "${home}/qt.nix"
    "${home}/rofi.nix"
    "${home}/spicetify.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
    "${home}/swaync.nix"
    "${home}/waybar.nix"
    "${home}/wofi.nix"
    "${home}/zathura.nix"
    "${home}/zellij.nix"
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
