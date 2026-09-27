from libqtile.config import Group, ScratchPad, DropDown

group_names = ["1", "2", "3", "4", "5", "6", "7", "8"]
groups = [Group(name=n, label=n) for n in group_names]

groups.append(
    ScratchPad("scratchpad", [
        DropDown(
            "spotify",
            "spotify",
            y=0.1,
            x=0.1,
            width=0.8,
            height=0.8,
            opacity=1.0,
            on_focus_lost_hide=False
        ),
        DropDown(
            "files",
            "thunar",
            y=0.2,
            x=0.2,
            width=0.6,
            height=0.6,
            opacity=1.0,
            on_focus_lost_hide=False
        ),
    ])
)
