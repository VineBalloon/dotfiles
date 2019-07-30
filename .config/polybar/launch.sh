#!/bin/sh

MONITOR1="$(xrandr --listmonitors | grep "0:" | cut -d ' ' -f6)"
MONITOR2="$(xrandr --listmonitors | grep "1:" | cut -d ' ' -f6)"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done

if [[ -n "$MONITOR1" ]]; then
	MONITOR="$MONITOR1" polybar main &
fi

if [[ -n "$MONITOR2" ]]; then
	MONITOR="$MONITOR2" polybar other &
fi

killall -q pa-applet
pa-applet &
while pgrep -u $UID -x pa-applet >/dev/null; do sleep 1; done
