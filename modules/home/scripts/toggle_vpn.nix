{pkgs, ...}:
pkgs.writeShellScriptBin "toggle_vpn" ''
  set -e

  VPN_DIR=~/.vpn
  CONF_FILES=($VPN_DIR/*.conf)
  WG_QUICK=${pkgs.wireguard-tools}/bin/wg-quick

  for CONF_PATH in "''${CONF_FILES[@]}"; do
    INTERFACE=$(basename "$CONF_PATH" .conf)
    if ip link show "$INTERFACE" &> /dev/null; then
      echo "VPN $INTERFACE is currently active. Bringing it down..."
      sudo $WG_QUICK down "$CONF_PATH"
      exit 0
    fi
  done

  echo "Select a VPN config to connect:"
  select CONFIG_PATH in "''${CONF_FILES[@]}"; do
    if [[ -n "$CONFIG_PATH" ]]; then
      INTERFACE=$(basename "$CONFIG_PATH" .conf)
      echo "Connecting to $INTERFACE..."
      sudo $WG_QUICK up "$CONFIG_PATH"
      break
    else
      echo "Invalid selection."
    fi
  done
''
