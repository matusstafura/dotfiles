#!/usr/bin/env bash

# Kill any existing polybar instances
pkill -x polybar 2>/dev/null

# Wait until they’re gone
while pgrep -x polybar >/dev/null; do sleep 0.5; done

# Launch polybar with explicit config path
polybar example -c /home/matus/.config/polybar/config.ini &

echo "Polybar launched..."
