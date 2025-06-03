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

    "${cfgDir}/scripts/connect_vpn.sh".source = ./scripts/connect_vpn.sh;
    "${cfgDir}/scripts/disconnect_vpn.sh".source = ./scripts/disconnect_vpn.sh;
    "${cfgDir}/scripts/vpns.py".source = ./scripts/vpns.py;
    "${cfgDir}/scripts/vpn_status.py".source = ./scripts/vpn_status.py;
  };

  home.activation.make-eww-scripts-executable = lib.hm.dag.entryAfter ["writeBoundary"] ''
    chmod +x ${cfgDir}/scripts/*.sh
    chmod +x ${cfgDir}/scripts/*.py
  '';
}
