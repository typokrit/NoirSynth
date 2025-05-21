#!/bin/bash

# Get the current workspace ID
wsid=$(hyprctl activeworkspace -j | jq '.id')

# Get all client addresses on the current workspace
clients=$(hyprctl clients -j | jq -r --argjson wsid "$wsid" '.[] | select(.workspace.id == $wsid) | .address')

# Loop through clients and toggle floating for each
for addr in $clients; do
    hyprctl dispatch togglefloating "$addr"
done

