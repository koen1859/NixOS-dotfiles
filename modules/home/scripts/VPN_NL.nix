{pkgs, ...}:
pkgs.writeShellScriptBin "VPN_NL" ''
  set -e

  CONFIG_PATH=~/VPN/wg-NL-448.conf
  INTERFACE=$(basename "$CONFIG_PATH" .conf)

  if ip link show "$INTERFACE" &> /dev/null; then
    sudo ${pkgs.wireguard-tools}/bin/wg-quick down "$CONFIG_PATH"
  else
    sudo ${pkgs.wireguard-tools}/bin/wg-quick up "$CONFIG_PATH"
  fi
''
