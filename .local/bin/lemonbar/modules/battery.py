def read_file(filename):
    with open(filename) as f:
        return f.read().strip()

def callback():
    battery = "BAT0"
    try:
        now = int(read_file(f"/sys/class/power_supply/{battery}/energy_now"))
        full = int(read_file(f"/sys/class/power_supply/{battery}/energy_full"))
        percent = round(now / full * 100)
        return f"BAT: {percent}%"
    except FileNotFoundError:
        return f"BAT: Disabled"

