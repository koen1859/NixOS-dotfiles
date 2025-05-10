{pkgs, ...}:
pkgs.writeShellScriptBin "VPN_Toggle" ''
  set -e

  VPN_DIR=~/VPN
  CONF_FILES=($VPN_DIR/*.conf)

  echo "Select a VPN config:"
  select CONFIG_PATH in "''${CONF_FILES[@]}"; do
    if [[ -n "$CONFIG_PATH" ]]; then
      break
    else
      echo "Invalid selection."
    fi
  done

  INTERFACE=$(basename "$CONFIG_PATH" .conf)

  if ip link show "$INTERFACE" &> /dev/null; then
    echo "Bringing down $INTERFACE"
    sudo ${pkgs.wireguard-tools}/bin/wg-quick down "$CONFIG_PATH"
  else
    echo "Bringing up $INTERFACE"
    sudo ${pkgs.wireguard-tools}/bin/wg-quick up "$CONFIG_PATH"
  fi
''
