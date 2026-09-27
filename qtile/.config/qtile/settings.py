import os

mod = "mod4"
terminal = "kitty"

colors = {
    "bg": "#000000",
    "fg": "#f2f4f8",
    "active": "#ffffff",
    "inactive": "#525252",
    "urgent": "#ff7eb6",
}

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=13,
    padding=12,
    foreground=colors["fg"],
)
extension_defaults = widget_defaults.copy()

bg = os.path.join(os.environ["HOME"], ".wp", "poi_city.png")
