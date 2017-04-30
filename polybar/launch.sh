#!/usr/bin/env sh
# Basic script to kill old polybars and launch new bar

killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar top
