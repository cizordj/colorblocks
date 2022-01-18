#!/bin/sh

DIR="$(dirname "$0")"
polybar-msg cmd quit

# Launch the preview bar
polybar -q top -c "$DIR"/preview.ini &
polybar -q mid -c "$DIR"/preview.ini &
polybar -q bottom -c "$DIR"/preview.ini &
