#!/bin/bash
STATE_FILE="/tmp/caffeine_active"

if [ -f "$STATE_FILE" ]; then
  rm -f "$STATE_FILE"
  killall caffeine
  notify-send -t 2000 "Caffeine" "Off"
else
  touch "$STATE_FILE"
  caffeine start &
  notify-send -t 2000 "Caffeine" "On"
fi
