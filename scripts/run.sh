#!/bin/sh
cd "$(dirname "$0")" || exit
rofi -no-config -no-lazy-grab -show run -modi run -theme rofi/launcher.rasi
