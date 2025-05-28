{inputs, ...}: let
  home = "${inputs.self}/modules/home";
in {
  imports = [
    "${home}/fetch"
    "${home}/firefox"
    "${home}/hypr"
    "${home}/nixvim"
    "${home}/wlogout"
    "${home}/wezterm"
    "${home}/zsh"
    "${home}/ags.nix"
    "${home}/atuin.nix"
    "${home}/bash.nix"
    "${home}/btop.nix"
    "${home}/ghostty.nix"
    "${home}/git.nix"
    "${home}/gtk.nix"
    "${home}/htop.nix"
    "${home}/kitty.nix"
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
    username = "koenstevens";
    homeDirectory = "/home/koenstevens";
    sessionVariables = {
      TEXMFHOME = "~/.texmf/";
    };
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
