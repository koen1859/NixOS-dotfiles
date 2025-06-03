#!/bin/bash
INTERFACE="$1"
CONF="$HOME/.vpn/$INTERFACE.conf"
[ -f "$CONF" ] || exit 1

wg-quick up "$CONF" && notify-send "VPN connected" "Interface: $INTERFACE"
