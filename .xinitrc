#!/bin/sh

# This file is sourced only when starting X11 session with startx.
# Otherwise, display manager should set up this variable and
# source the xprofile.

export DESKTOP_SESSION="dwm"

[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec "$DESKTOP_SESSION"
