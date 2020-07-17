#!/usr/bin/python3
import sys
import re
import subprocess

def shoot(arg, dst):
    print(f"{tool_name} {arg} | {dst}")


tool_name = "maim"
default_tool = "area"
default_dest = "clip"

file_path = "~/Pictures"
file_name = "Screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"

tool = {
    "area":   "-u -s -m 1",
    "window": "-B -u -i $(xdotool getactivewindow)",
    "screen": "-u",
}

dest = {
    "file": f"tee {file_path}/{file_name}",
    "clip": "xclip -selection clipboard -t image/png",
}

args = sys.argv[1:]
if len(args) == 0:
    shoot(tool[default_tool], dest[default_dest])

elif len(args) == 1:
    if args[0] in tool:
        shoot(tool[args[0]], dest[default_dest])
    else:
        print("Wrong arguments")
        quit(1)

elif len(args) == 2:
    if args[0] == "to" and args[1] in dest:
        shoot(tool[default_tool], dest[args[1]])
    else:
        print("Wrong arguments")
        quit(1)

elif len(args) == 3:
    if args[1] == "to" and args[0] in tool and args[2] in dest:
        shoot(tool[args[0]], dest[args[2]])
    else:
        print("Wrong arguments")
        quit(1)

