#!/bin/sh
cd "$(dirname "$0")" || exit
SDIR="$(./scripts/sdir.sh)"
THEME_FILE="$SDIR/rofi/launcher.rasi"
rofi -no-config -no-lazy-grab -show run -modi run -theme "$THEME_FILE"
