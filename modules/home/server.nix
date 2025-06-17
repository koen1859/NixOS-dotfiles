{
  inputs,
  pkgs,
  ...
}: let
  inherit (import "${inputs.self}/variables.nix" {inherit inputs pkgs;}) home username;
in {
  imports = [
    "${home}/fetch"
    "${home}/zsh"
    "${home}/atuin.nix"
    "${home}/bash.nix"
    "${home}/btop.nix"
    "${home}/git.nix"
    "${home}/programming.nix"
    "${home}/starship.nix"
    "${home}/stylix.nix"
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    packages = [
      inputs.nvim-conf.packages.${pkgs.system}.default
    ];
  };
  programs = {
    home-manager.enable = true;

    starship.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    atuin.enable = true;
    bash.enable = true;
    zsh.enable = true;
    feh.enable = true;
    fd.enable = true;

    git.enable = true;
    lazygit.enable = true;
  };
}
