from settings import widget_defaults, extension_defaults
from groups import groups
from keys import keys, mouse
from layouts import layouts, floating_layout
from screens import screens
import hooks

dgroups_key_binder = None
dgroups_app_rules: list = []
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True
auto_minimize = True
idle_inhibitors: list = []
wmname = "LG3D"