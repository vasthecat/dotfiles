from subprocess import run as _run


class Desktop:
    def __init__(self):
        self.id = None
        self.name = None
        self.focused = False
        self.occupied = False
        self.urgent = False


def run(command):
    return _run(command.split(), capture_output=True).stdout.decode().strip()


def get_desktops():
    focused = run("bspc query -D -d .focused")
    occupied = run("bspc query -D -d .occupied").split("\n")
    urgent = run("bspc query -D -d .urgent").split("\n")

    desktops = []
    for desktop_id in run("bspc query -D").split("\n"):
        desktop = Desktop()
        desktop.id = desktop_id
        desktop.name = run(f"bspc query -D -d {desktop.id} --names")
        desktop.focused = desktop.id == focused
        desktop.occupied = desktop.id in occupied
        desktop.urgent = desktop.id in urgent

        desktops.append(desktop)

    return desktops


def get_focused_window():
    return run("bspc query -N -n")


def cut_name(name):
    if len(name) > 70:
        return name[:65] + "..."
    else:
        return name


def get_focused_window_name():
    focused = get_focused_window().lower()
    for window in run("wmctrl -l").split("\n"):
        wid, _, _, name = window.split(maxsplit=3)
        if wid.lower() == focused:
            return cut_name(name)
    return ''


