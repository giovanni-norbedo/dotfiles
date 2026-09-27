#!/bin/bash

python3 - << 'EOF' | rofi -dmenu \
    -p "Keybinds" \
    -theme ~/.config/rofi/list.rasi \
    -i \
    -no-custom \
    -no-fixed-num-lines

import sys, os
sys.path.insert(0, os.path.expanduser('~/.config/qtile'))
import keys

items = []
for k in keys.keys:
    desc = getattr(k, 'desc', '')
    if not desc or desc.lower().startswith('switch to vt'):
        continue

    mods = '+'.join(k.modifiers)
    combo = f"{mods}+{k.key}" if mods else k.key
    combo = (
        combo.replace('mod4', 'Super')
             .replace('mod1', 'Alt')
             .replace('control', 'Ctrl')
             .replace('shift', 'Shift')
             .replace('slash', '/')
             .replace('semicolon', ';')
             .replace('space', 'Space')
    )
    items.append((combo, desc))

max_len = max(len(c) for c, _ in items)
for combo, desc in items:
    print(f"{combo:<{max_len + 4}} →   {desc}")
EOF
