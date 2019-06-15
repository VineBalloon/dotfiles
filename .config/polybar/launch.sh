#!/bin/bash

# Terminate instances
killall -q polybar

# Wait
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar mybar &

echo "Launched polybar"
