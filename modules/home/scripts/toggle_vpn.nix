{pkgs, ...}:
pkgs.writeShellScriptBin "protonvpn" ''
  set -e

  VPN_DIR="$HOME/.vpn"
  WG_QUICK="${pkgs.wireguard-tools}/bin/wg-quick"
  NOTIFY_SEND="${pkgs.libnotify}/bin/notify-send"
  ROFI="${pkgs.rofi-wayland}/bin/rofi"

  # Function to prompt for password using rofi
  prompt_password() {
    $ROFI -dmenu -password -p "Enter sudo password:" || exit 1
  }

  # Check for active VPN
  shopt -s nullglob
  CONF_FILES=("$VPN_DIR"/*.conf)
  for CONF_PATH in "''${CONF_FILES[@]}"; do
    INTERFACE=$(basename "$CONF_PATH" .conf)
    if ip link show "$INTERFACE" &> /dev/null; then
      CHOICE=$($ROFI -dmenu -p "VPN '$INTERFACE' is active. Disconnect?" <<< $'Yes\nNo')
      if [ "$CHOICE" = "Yes" ]; then
        echo "$(prompt_password)" | sudo -S "$WG_QUICK" down "$CONF_PATH"
        $NOTIFY_SEND "VPN disconnected" "Interface: $INTERFACE"
      fi
      exit 0
    fi
  done

  # No active VPN, show rofi list
  if [ ''${#CONF_FILES[@]} -eq 0 ]; then
    $NOTIFY_SEND "Error" "No VPN configurations found in $VPN_DIR"
    exit 1
  fi

  OPTIONS=$(for f in "''${CONF_FILES[@]}"; do echo "$(basename "$f" .conf)"; done | sort)
  SELECTED=$(echo "$OPTIONS" | $ROFI -dmenu -p "Select VPN to connect")

  if [ -n "$SELECTED" ]; then
    CONFIG_PATH="$VPN_DIR/$SELECTED.conf"
    if [ -f "$CONFIG_PATH" ]; then
      echo "$(prompt_password)" | sudo -S "$WG_QUICK" up "$CONFIG_PATH"
      $NOTIFY_SEND "VPN connected" "Interface: $SELECTED"
    else
      $NOTIFY_SEND "Error" "Configuration file $CONFIG_PATH not found"
      exit 1
    fi
  else
    $NOTIFY_SEND "Error" "No VPN selected"
    exit 1
  fi
''
