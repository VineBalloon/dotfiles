#!/bin/sh

killall -q polybar
polybar mybar &
while pgrep -u $UID -x polybar >/dev/null
do sleep 1; done

killall -q pa-applet
pa-applet &
while pgrep -u $UID -x pa-applet >/dev/null
do sleep 1; done
