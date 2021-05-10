from subprocess import run as _run


def run(command):
    return _run(command.split(), capture_output=True).stdout.decode().strip()


def callback():
    try:
        name = run('xkblayout-state print "%s"').strip('"')
        return f"LNG: {name.upper()}"
    except FileNotFoundError:
        return f"LNG: xkblayout-state not installed"
