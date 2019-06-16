#!/bin/bash

# Terminate instances
killall -q polybar

# Launch Polybar
polybar mybar &

LAUNCHED="Launched"
# NetworkManager applet
if command -v nm-applet >/dev/null; then
    killall -q nm-applet
    nm-applet &
    LAUNCHED="$LAUNCHED nm-applet"
fi

# PulseAudio applet
if command -v pa-applet >/dev/null; then
    killall -q pa-applet
    pa-applet &
    LAUNCHED="$LAUNCHED pa-applet"
fi

# Wait
while pgrep -u $UID -x polybar >/dev/null &&
        pgrep -u $UID -x nm-applet >/dev/null &&
        pgrep -u $UID -x pa-applet >/dev/null
do sleep 1; done

echo $LAUNCHED
