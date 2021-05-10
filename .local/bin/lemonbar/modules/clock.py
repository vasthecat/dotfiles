from time import strftime


def callback():
    clock = strftime("%d %b (%a) %H:%M")
    return f"CLK: {clock}"
