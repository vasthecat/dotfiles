from chain import ArrowModuleChain
from modules import volume, battery, updates, language, clock
import bspc


def get_desktops_bar():
    bar = []
    focused_bg = idle_fg = urgent_fg = occupied_fg = "#ebdbb2"
    focused_fg = idle_bg = "#282828"
    urgent_bg = "#cc241d"
    occupied_bg = "#928374"

    for i, desktop in enumerate(bspc.get_desktops(), 1):
        if desktop.focused:
            fg = focused_fg
            bg = focused_bg
        elif desktop.urgent:
            fg = urgent_fg
            bg = urgent_bg
        elif desktop.occupied:
            fg = occupied_fg
            bg = occupied_bg
        else:
            fg = idle_fg
            bg = idle_bg

        bar.append({
            "callback": lambda idx=i: str(idx),
            "foreground": fg,
            "background": bg,
        })

    return bar


status_modules = [
    {
        "callback": updates.callback,
        "foreground": "#ebdbb2",
        "background": "#689d6a",
    },
    {
        "callback": volume.callback,
        "foreground": "#ebdbb2",
        "background": "#458588",
    },
    {
        "callback": battery.callback,
        "foreground": "#ebdbb2",
        "background": "#b16286",
    },
    {
        "callback": language.callback,
        "foreground": "#ebdbb2",
        "background": "#98971a",
    },
    {
        "callback": clock.callback,
        "foreground": "#ebdbb2",
        "background": "#cc241d",
    },
]

desktops = ArrowModuleChain(right=True, capped_left=True, capped_right=False)
desktops.extend(*get_desktops_bar())

focused_window = bspc.get_focused_window_name()

status = ArrowModuleChain(right=False, capped_left=False, capped_right=True)
status.extend(*status_modules)

print(f"%{{l}}{desktops} %{{F#ebdbb2}}{focused_window} %{{r}}{status}%{{B#000000}}")
