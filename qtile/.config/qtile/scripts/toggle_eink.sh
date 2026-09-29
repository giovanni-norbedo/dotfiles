#!/bin/bash

STATE_FILE="/tmp/eink_active"
SHADER_PATH="$HOME/.config/qtile/scripts/eink.glsl"
PICOM_CONF="$HOME/.config/picom/picom.conf"

if [ -f "$STATE_FILE" ]; then
  rm -f "$STATE_FILE"
  feh --bg-fill ~/.wp/oled.png
  killall -q picom
  sleep 0.2
  picom --config "$PICOM_CONF" -b &
  notify-send "Screen" "Default"
else
  touch "$STATE_FILE"
  feh --bg-fill ~/.wp/white.png
  killall -q picom
  sleep 0.2
  picom --backend glx --window-shader-fg "$SHADER_PATH" -b &
  notify-send "Screen" "E-Ink"
fi
