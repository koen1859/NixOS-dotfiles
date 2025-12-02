{
  home,
  username,
  ...
}: {
  imports = [
    "${home}/shell"
    "${home}/atuin.nix"
    "${home}/fastfetch.nix"
    "${home}/git.nix"
    "${home}/programming.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
    "${home}/sops.nix"
    "${home}/ssh.nix"
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
    nvim-conf.enable = true;
  };
}
