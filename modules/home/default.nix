{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) home username;
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
    "${home}/brave.nix"
    "${home}/chromium.nix"
    "${home}/git.nix"
    "${home}/kitty.nix"
    "${home}/latex.nix"
    "${home}/librewolf.nix"
    "${home}/nixcord.nix"
    "${home}/packages.nix"
    "${home}/programming.nix"
    "${home}/qt.nix"
    "${home}/qutebrowser.nix"
    "${home}/rofi.nix"
    "${home}/spicetify.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
    "${home}/swaync.nix"
    "${home}/waybar.nix"
    "${home}/zathura.nix"
    "${home}/zoxide.nix"
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    sessionVariables = {
      nixos_ozone_wl = "1";
      EDITOR = "nvim";
      HYPRSHOT_DIR = "/home/${username}/Pictures/";
    };
  };
  programs = {
    home-manager.enable = true;

    eww.enable = true;
    wlogout.enable = true;
    rofi.enable = true;
    waybar.enable = true;

    starship.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    atuin.enable = true;
    bash.enable = true;
    zsh.enable = true;
    feh.enable = true;
    fd.enable = true;
    zoxide.enable = true;

    wezterm.enable = true;
    kitty.enable = true;

    firefox.enable = true;
    librewolf.enable = true;
    chromium.enable = true;
    qutebrowser.enable = false;
    brave.enable = true;

    nixcord.enable = true;
    spicetify.enable = true;
    zathura.enable = true;

    git.enable = true;
    lazygit.enable = true;
  };
}
