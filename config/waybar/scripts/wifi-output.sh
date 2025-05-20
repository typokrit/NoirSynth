#!/bin/bash

# File: ~/.config/waybar/scripts/wifi-output.sh

STATE_FILE="/tmp/wifi_toggle_state"

# Default to icon state if file doesn't exist
if [[ ! -f $STATE_FILE ]]; then
    echo "icon" > "$STATE_FILE"
fi

INTERFACE=$(ip link | awk '/state UP/ {print $2}' | sed 's/://')

# Safety check
[[ -z "$INTERFACE" ]] && echo '{"text": "No WiFi", "alt": "wifi"}' && exit 0

STATE=$(cat "$STATE_FILE")

if [[ "$STATE" == "icon" ]]; then
    echo '{"text": "📶", "alt": "wifi"}'
else
    RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
    sleep 1
    RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
    TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

    RX_RATE=$(( (RX2 - RX1) / 1024 ))
    TX_RATE=$(( (TX2 - TX1) / 1024 ))

    echo "{\"text\": \"⬇️ ${RX_RATE}KB/s ⬆️ ${TX_RATE}KB/s\", \"alt\": \"wifi-speed\"}"
fi

