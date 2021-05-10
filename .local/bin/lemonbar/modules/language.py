from subprocess import run as _run


def run(command):
    return _run(command.split(), capture_output=True).stdout.decode().strip()


def callback():
    name = run('xkblayout-state print "%s"').strip('"')
    return f"LNG: {name.upper()}"
