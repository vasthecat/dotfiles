#!/bin/sh

if [ "$DISPLAY_SESSION" = "dwm" ]; then
    session_line=dwm
elif [ "$DISPLAY_SESSION" = "openbox" ]; then
    session_line=openbox-session
elif [ "$DISPLAY_SESSION" = "xmonad" ]; then
    session_line=xmonad
else
    session_line="$DISPLAY_SESSION"
    # echo "DISPLAY_SESSION not specified. Exiting..."
    # exit 1
fi

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec "$session_line"
