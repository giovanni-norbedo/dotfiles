#!/usr/bin/env bash

polybar-msg cmd quit

echo "---" | tee -a /tmp/top.log
echo "---" | tee -a /tmp/bottom.log

polybar top --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/top.log & disown
polybar bottom --config=~/.config/polybar/config.ini 2>&1 | tee -a /tmp/bottom2>&1 | tee -a /tmp/bottom.log & disown

echo "Bar launched..."
