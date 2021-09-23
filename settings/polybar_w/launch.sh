#!/bin/env sh

pkill polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar one &
polybar two &

if xrandr -q | grep 'HDMI-0 connected' > /dev/null; then
    polybar three &
    polybar four &
fi
