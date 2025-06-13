{pkgs, ...}: let
  inherit (import ../variables.nix) username;
in {
  users = {
    defaultUserShell = pkgs.zsh;
    users.${username} = {
      isNormalUser = true;
      extraGroups = ["wheel" "libvirtd"];
    };
  };
  security.sudo.extraRules = [
    {
      users = ["${username}"];
      commands = [
        {
          command = "/run/current-system/sw/bin/wg-quick";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];
}
