#!/bin/sh
rofi -no-config -no-lazy-grab -show drun \
    -modi drun -theme "$(dirname "$0")/rofi/launcher.rasi"
