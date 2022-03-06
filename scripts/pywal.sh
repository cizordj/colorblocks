#!/bin/sh

SDIR="$(./scripts/sdir.sh)"
# Color files
PFILE="$(dirname "$0")/../colors.ini"
RFILE="$SDIR/rofi/colors.rasi"

# Get colors
pywal_get() {
    wal -i "$1" -q -t
}

# Change colors
change_color() {
    # polybar
    sed -i -e "s/background = #.*/background = $BG/g" "$PFILE"
    sed -i -e "s/foreground = #.*/foreground = $FG/g" "$PFILE"
    sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" "$PFILE"
    sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" "$PFILE"
    sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" "$PFILE"
    sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" "$PFILE"
    sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" "$PFILE"
    sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" "$PFILE"
    sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" "$PFILE"
    sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" "$PFILE"
    sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" "$PFILE"

    # rofi
    cat > "$RFILE" <<- EOF
/* colors */

* {
    al:    #00000000;
    bg:    ${BG}FF;
    bg1:   ${SH8}FF;
    bg2:   ${SH7}FF;
    bg3:   ${SH6}FF;
    fg:    ${FGA}FF;
}
EOF

    polybar-msg cmd restart
}

# Main
if command -v wal; then
    if [ "$#" -eq 1 ]; then
        pywal_get "$1"

        # Source the pywal color file
        . "$HOME/.cache/wal/colors.sh"

        BG=$(printf "%s\n" "$background")
        FG=$(printf "%s\n" "$color0")
        FGA=$(printf "%s\n" "$color7")
        SH1=$(printf "%s\n" "$color1")
        SH2=$(printf "%s\n" "$color2")
        SH3=$(printf "%s\n" "$color1")
        SH4=$(printf "%s\n" "$color2")
        SH5=$(printf "%s\n" "$color1")
        SH6=$(printf "%s\n" "$color2")
        SH7=$(printf "%s\n" "$color1")
        SH8=$(printf "%s\n" "$color2")

        change_color
    else
        printf '%s\n' "[!] Please enter the path to wallpaper."
        echo "Usage : ./pywal.sh path/to/image"
    fi
else
    echo "[!] 'pywal' is not installed."
fi
