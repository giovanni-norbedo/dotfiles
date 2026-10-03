from libqtile.config import Key, Click, Drag
from libqtile.lazy import lazy
from settings import mod, terminal
from hooks import toggle_sticky
from groups import groups, group_names
import os

keys = [
    # layout
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    Key([mod, "mod1"], "h", lazy.window.move_floating(-90, 0)),
    Key([mod, "mod1"], "l", lazy.window.move_floating(90, 0)),
    Key([mod, "mod1"], "k", lazy.window.move_floating(0, -90)),
    Key([mod, "mod1"], "j", lazy.window.move_floating(0, 90)),
    Key([mod, "shift", "mod1"], "h", lazy.window.resize_floating(-90, 0)),
    Key([mod, "shift", "mod1"], "l", lazy.window.resize_floating(90, 0)),
    Key([mod, "shift", "mod1"], "k", lazy.window.resize_floating(0, -90)),
    Key([mod, "shift", "mod1"], "j", lazy.window.resize_floating(0, 90)),
    # window management
    Key([mod], "w", lazy.window.kill(), desc="close window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="toggle floating window"),
    Key([mod], "Tab", lazy.next_layout(), desc="next layout"),
    Key(
        [mod, "shift"], "Return", lazy.layout.toggle_split(), desc="toggle stack split"
    ),
    Key([mod, "shift"], "s", toggle_sticky, desc="toggle sticky window"),
    # applications
    Key([mod], "Return", lazy.spawn(terminal), desc="open terminal"),
    Key(
        [mod],
        "space",
        lazy.spawn("rofi -show drun -theme ~/.config/rofi/launcher.rasi"),
        desc="app launcher",
    ),
    Key(
        [mod],
        "v",
        lazy.spawn(
            "rofi -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}' -theme ~/.config/rofi/list.rasi"
        ),
        desc="clipboard manager",
    ),
    Key(
        [mod],
        "q",
        lazy.spawn("rofi -show window -theme ~/.config/rofi/launcher.rasi"),
        desc="window switcher",
    ),
    Key([mod], "i", lazy.spawn("firefox"), desc="open firefox"),
    Key(
        [mod],
        "c",
        lazy.spawn("positron"),
        desc="open positron",
    ),
    Key([mod, "shift"], "c", lazy.spawn("code"), desc="open vscode"),
    Key([mod], "o", lazy.spawn("obsidian"), desc="open obsidian"),
    Key(
        [mod],
        "d",
        lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/translate.sh")),
        desc="translate selection",
    ),
    Key(
        [mod],
        "F1",
        lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/show_keys.sh")),
        desc="show keybindings",
    ),
    Key([mod], "g", lazy.spawn("flameshot gui"), desc="take screenshot"),
    Key([mod], "e", lazy.spawn("thunar"), desc="file manager"),
    # network
    Key(
        [mod], "b", lazy.spawn("dbus-launch blueman-manager"), desc="bluetooth manager"
    ),
    Key(
        [mod],
        "n",
        lazy.spawn("kitty --class nmtui-float --title nmtui-float -e nmtui"),
        desc="wi-fi manager",
    ),
    Key([mod], "a", lazy.spawn("pavucontrol"), desc="audio mixer"),
    # system
    Key(
        [mod],
        "z",
        lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/caffeine.sh")),
        desc="toggle caffeine (keep awake)",
    ),
    Key(
        [mod],
        "Escape",
        lazy.spawn("betterlockscreen -l -- --time-size 60"),
        desc="lock screen",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="reload qtile config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="exit qtile"),
    Key(
        [mod],
        "x",
        lazy.spawn(os.path.expanduser("~/.config/rofi/powermenu.sh")),
        desc="power menu",
    ),
    # extra scripts
    Key(
        [mod],
        "p",
        lazy.spawn(os.path.expanduser("~/.config/qtile/scripts/toggle_eink.sh")),
        desc="toggle e-ink mode",
    ),
    Key(
        [mod, "shift"],
        "p",
        lazy.spawn(os.path.expanduser("~/.local/bin/latexocr")),
        desc="run latex ocr",
    ),
    # scratchpads
    Key(
        [mod],
        "s",
        lazy.group["scratchpad"].dropdown_toggle("spotify"),
        desc="spotify scratchpad",
    ),
    # media / audio
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    ),
    Key([], "XF86AudioMute", lazy.spawn("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
]

for name in group_names:
    keys.extend(
        [
            Key([mod], name, lazy.group[name].toscreen()),
            Key([mod, "shift"], name, lazy.window.togroup(name, switch_group=False)),
        ]
    )

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]
