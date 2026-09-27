from libqtile import layout
from libqtile.config import Match
from settings import colors


layouts = [
    layout.Columns(
        border_focus=colors["active"],
        border_normal="#000000",
        border_width=1,
        margin=0,
        margin_on_single=False,
        border_on_single=False,
        num_columns=2,
        insert_position=1,
        fair=True,
    ),
    layout.Max(
        margin=0,
    ),
]

floating_layout = layout.Floating(
    border_focus=colors["active"],
    border_normal=colors["inactive"],
    border_width=1,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="ssh-askpass"),
        Match(title="pinentry"),
        Match(wm_class="pavucontrol"),
        Match(wm_class="blueman-manager"),
        Match(wm_class="nm-connection-editor"),
        Match(wm_class="galculator"),
        Match(wm_class="gnome-calculator"),
        Match(wm_class="qalculate-gtk"),
        Match(wm_class="feh"),
        Match(wm_class="imv"),
        Match(wm_class="mpv"),
        Match(title="LaTeX OCR"),
        Match(title="Volume Control"),
        Match(title="File Operation Progress"),
        Match(wm_class="nmtui-float"),
    ]
)
