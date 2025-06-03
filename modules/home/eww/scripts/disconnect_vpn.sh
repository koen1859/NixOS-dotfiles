#!/bin/bash
INTERFACE="$1"
CONF="$HOME/.vpn/$INTERFACE.conf"
[ -f "$CONF" ] || exit 1

wg-quick down "$CONF" && notify-send "VPN disconnected"
