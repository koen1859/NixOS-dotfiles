{
  inputs,
  pkgs,
  ...
}: let
  inherit (import ../variables.nix {inherit inputs pkgs;}) shell username;
in {
  users = {
    defaultUserShell = shell;
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
