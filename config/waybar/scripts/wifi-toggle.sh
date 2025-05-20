#!/bin/bash

# File: ~/.config/waybar/scripts/wifi-toggle.sh

STATE_FILE="/tmp/wifi_toggle_state"

if [[ ! -f $STATE_FILE ]]; then
    echo "icon" > "$STATE_FILE"
fi

CURRENT=$(cat "$STATE_FILE")

if [[ "$CURRENT" == "icon" ]]; then
    echo "speed" > "$STATE_FILE"
else
    echo "icon" > "$STATE_FILE"
fi

