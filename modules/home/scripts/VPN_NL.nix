{pkgs, ...}:
pkgs.writeShellScriptBin "VPN_NL" ''
  set -e

  CONFIG_PATH=~/VPN/wg-NL-448.conf
  INTERFACE=$(basename "$CONFIG_PATH" .conf)

  if ip link show "$INTERFACE" &> /dev/null; then
    echo "WireGuard interface $INTERFACE is already up. Disconnecting..."
    sudo ${pkgs.wireguard-tools}/bin/wg-quick down "$CONFIG_PATH"
  fi

  echo "Connecting WireGuard interface $INTERFACE..."
  sudo ${pkgs.wireguard-tools}/bin/wg-quick up "$CONFIG_PATH"
''
