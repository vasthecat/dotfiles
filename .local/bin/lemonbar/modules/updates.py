from subprocess import run as _run
from time import time


def run(command):
    return _run(command.split(), capture_output=True).stdout.decode().strip()


def pacman_count():
    cnt = 0
    for line in run('pacman -Qu').split("\n"):
        if "[ignored]" not in line:
            cnt += 1
    return cnt


def yay_count():
    cnt = 0
    for line in run('yay -Qau').split("\n"):
        if "[ignored]" not in line:
            cnt += 1
    return cnt


def callback():
    tmp_file = "/tmp/lemonbar/updates"
    try:
        with open(tmp_file) as f:
            data = f.read().split()
    except FileNotFoundError:
        data = ''

    try:
        timestamp = float(data[0])
    except (ValueError, IndexError):
        timestamp = 0

    if time() - timestamp > 900:
        pacman = pacman_count()
        aur = yay_count()
        with open(tmp_file, "w") as f:
            f.write(f"{time()} {pacman} {aur}")
    else:
        pacman = data[1]
        aur = data[2]

    return f"UPD: {pacman}+{aur}"

