{
  home,
  username,
  ...
}: {
  imports = [
    "${home}/browser"
    "${home}/hypr"
    "${home}/terminal"
    "${home}/scripts"
    "${home}/shell"
    "${home}/wlogout"
    "${home}/atuin.nix"
    "${home}/btop.nix"
    "${home}/fastfetch.nix"
    "${home}/foot.nix"
    "${home}/git.nix"
    "${home}/latex.nix"
    "${home}/mango.nix"
    "${home}/nixcord.nix"
    "${home}/noctalia.nix"
    "${home}/packages.nix"
    "${home}/programming.nix"
    "${home}/qt.nix"
    "${home}/rofi.nix"
    "${home}/sops.nix"
    "${home}/spicetify.nix"
    "${home}/ssh.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
    "${home}/swaync.nix"
    "${home}/waybar.nix"
    "${home}/zathura.nix"
    "${home}/zed.nix"
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
  };
}
