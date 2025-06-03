{
  config,
  lib,
  ...
}: let
  cfgDir = "${config.xdg.configHome}/eww";
in {
  programs.eww.enable = true;
  home.file = {
    "${cfgDir}/eww.yuck".source = ./eww.yuck;

    "${cfgDir}/scripts/vpns.py".source = ./scripts/vpns.py;
    "${cfgDir}/scripts/vpn_status.py".source = ./scripts/vpn_status.py;
  };
}
