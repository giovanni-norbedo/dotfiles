import os
import subprocess
from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy

from settings import colors, bg

def check_bluetooth():
    try:
        out = subprocess.check_output(
            ["bluetoothctl", "devices", "Connected"],
            text=True, stderr=subprocess.DEVNULL
        ).strip()
        if out:
            name = " ".join(out.splitlines()[0].split()[2:])
            return f"BLUETOOTH {name}"
        return "BLUETOOTH off"
    except Exception:
        return "BLUETOOTH --"

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.Spacer(length=8),
                widget.GroupBox(
                    highlight_method="line",
                    highlight_color=[colors["bg"], colors["bg"]],
                    this_current_screen_border="#ffffff",
                    active="#ffffff",
                    inactive="#525252",
                    urgent_alert_method="text",
                    urgent_text=colors["urgent"],
                    borderwidth=2,
                    padding_x=6,
                    margin_x=0,
                ),
                widget.Spacer(length=6),
                widget.Mpris2(
                    name="spotify",
                    objname="org.mpris.MediaPlayer2.spotify",
                    paused_text="PAUSED",
                    stopped_text="",
                    format="{xesam:title} - {xesam:artist}",
                    foreground=colors["fg"],
                ),
                widget.Spacer(length=bar.STRETCH),
                widget.GenPollText(
                    func=lambda: "CAFFEINE on" if os.path.exists("/tmp/caffeine_active") else "CAFFEINE off",
                    update_interval=1,
                ),
                widget.Spacer(length=12),
                widget.Wlan(
                    interface="wlan0",
                    format="WIFI {essid}",
                    disconnected_message="WIFI off",
                ),
                widget.Spacer(length=12),
                widget.GenPollText(
                    func=check_bluetooth,
                    update_interval=5.0,
                ),
                widget.Spacer(length=12),
                widget.Backlight(
                    backlight_name="intel_backlight",
                    fmt="BRIGHTNESS {}",
                ),
                widget.Spacer(length=12),
                widget.PulseVolume(
                    fmt="VOLUME {}",
                ),
                widget.Spacer(length=12),
                widget.Battery(
                    format="BATTERY {percent:2.0%}{char}",
                    charge_char=" CHARGING",
                    discharge_char="",
                    full_char="",
                    empty_char="",
                    unknown_char="",
                    notify_below=15,
                ),
                widget.Spacer(length=12),
                widget.Clock(
                    format="%d %b  %H:%M",
                ),
                widget.Spacer(length=8),
            ],
            32,
            background=colors["bg"],
            border_width=[0, 0, 0, 0],
        ),
        wallpaper=bg,
        wallpaper_mode="fill",
    ),
]
