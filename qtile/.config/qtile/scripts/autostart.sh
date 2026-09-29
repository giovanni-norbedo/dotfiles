#!/bin/bash

if pgrep -x "picom" >/dev/null; then
  echo "picom is running"
else
  picom --config ~/.config/picom/picom.conf -b
fi

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

udiskie &
dunst &
greenclip daemon &

xsetroot -cursor_name left_ptr &

touchegg &

feh --bg-fill ~/.wp/oled.png &
