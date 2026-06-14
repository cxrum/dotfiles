#!/usr/bin/env bash

TREE=$(swaymsg -t get_tree)

COUNT=$(echo "$TREE" | jq '[recurse(.nodes[]?, .floating_nodes[]?) | select(.name == "__i3_scratch") | .floating_nodes[]] | length')

if [ "$COUNT" -eq 0 ]; then
    exit 0
fi

CHOICE=$(echo "$TREE" | jq -r '
  recurse(.nodes[]?, .floating_nodes[]?) | 
  select(.name == "__i3_scratch") | 
  .floating_nodes[] | 
  "\(.id) | \(.app_id // .window_properties.class // "Unknown") | \(.name)\u0000icon\u001f\( (.app_id // .window_properties.class // "unknown") | ascii_downcase )"
' | fuzzel --dmenu --prompt="Scratchpad: " --lines=10)

if [ -z "$CHOICE" ]; then
    exit 0
fi

WINDOW_ID=$(echo "$CHOICE" | awk '{print $1}')
swaymsg "[con_id=$WINDOW_ID] scratchpad show"
