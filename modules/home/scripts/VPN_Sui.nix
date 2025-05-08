{pkgs, ...}:
pkgs.writeShellScriptBin "VPN_Sui" ''
  set -e

  CONFIG_PATH=~/VPN/wg-CH-347.conf
  INTERFACE=$(basename "$CONFIG_PATH" .conf)

  if ip link show "$INTERFACE" &> /dev/null; then
    sudo ${pkgs.wireguard-tools}/bin/wg-quick down "$CONFIG_PATH"
  else
    sudo ${pkgs.wireguard-tools}/bin/wg-quick up "$CONFIG_PATH"
  fi
''
