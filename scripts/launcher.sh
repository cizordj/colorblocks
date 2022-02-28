#!/bin/sh
./sdir.sh
THEME_FILE="$SDIR/rofi/launcher.rasi"
rofi -no-config -no-lazy-grab -show drun \
    -modi drun -theme "$THEME_FILE"
