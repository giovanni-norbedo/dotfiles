import os
import subprocess
from libqtile import hook, qtile
from libqtile.lazy import lazy

sticky_windows: list = []

@lazy.function
def toggle_sticky(qtile):
    window = qtile.current_window
    if window is None:
        return
    if window in sticky_windows:
        sticky_windows.remove(window)
    else:
        sticky_windows.append(window)

@hook.subscribe.setgroup
def move_sticky_windows():
    for window in sticky_windows:
        window.togroup(qtile.current_group.name)
        window.bring_to_front()

@hook.subscribe.client_killed
def remove_sticky(client):
    if client in sticky_windows:
        sticky_windows.remove(client)

@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser("~/.config/qtile/scripts/autostart.sh")
    if os.path.isfile(script) and os.access(script, os.X_OK):
        subprocess.Popen([script])


