#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar_example.log
# polybar bar1 >>/tmp/polybar1.log 2>&1 & disown
# polybar bar2 >>/tmp/polybar2.log 2>&1 & disown
polybar example >>/tmp/polybar_example.log 2>&1 & disown

if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
  polybar top_external >>/tmp/polybar_top_external.log 2>&1 & disown
fi
echo "Bars launched..."
