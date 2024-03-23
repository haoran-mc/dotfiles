#!/usr/bin/bash

killall -q polybar

while pgrep -x >/dev/null; do sleep 1; done

polybar -q main -c ~/dotfiles/i3wm/polybar.ini
