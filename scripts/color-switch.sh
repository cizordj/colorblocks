#!/bin/sh

SDIR="$(./scripts/sdir.sh)"
listOptions(){
cat << EOF
 ♥ amber|
 ♥ blue|
 ♥ blue-gray|
 ♥ brown|
 ♥ cyan|
 ♥ deep-orange|
 ♥ deep-purple|
 ♥ green|
 ♥ gray|
 ♥ indigo|
 ♥ blue-light|
 ♥ green-light|
 ♥ lime|
 ♥ orange|
 ♥ pink|
 ♥ purple|
 ♥ red|
 ♥ teal|
 ♥ yellow|
 ♥ amber-dark|
 ♥ blue-dark|
 ♥ blue-gray-dark|
 ♥ brown-dark|
 ♥ cyan-dark|
 ♥ deep-orange-dark|
 ♥ deep-purple-dark|
 ♥ green-dark|
 ♥ gray-dark|
 ♥ indigo-dark|
 ♥ blue-light-dark|
 ♥ green-light-dark|
 ♥ lime-dark|
 ♥ orange-dark|
 ♥ pink-dark|
 ♥ purple-dark|
 ♥ red-dark|
 ♥ teal-dark|
 ♥ yellow-dark|
EOF
}
OPTIONS="$(listOptions | tr -d '\n')"
MENU="$(printf '%s' "$OPTIONS" | \
    rofi -no-config -no-lazy-grab -sep "|" \
    -dmenu -i -p '' -theme "$SDIR/rofi/styles.rasi")"
    case "$MENU" in
        ## Light Colors
        *amber) "./scripts"/colors-light.sh --amber ;;
        *blue) "./scripts"/colors-light.sh --blue ;;
        *blue-gray) "./scripts"/colors-light.sh --blue-gray ;;
        *brown) "./scripts"/colors-light.sh --brown ;;
        *cyan) "./scripts"/colors-light.sh --cyan ;;
        *deep-orange) "./scripts"/colors-light.sh --deep-orange ;;
        *deep-purple) "./scripts"/colors-light.sh --deep-purple ;;
        *green) "./scripts"/colors-light.sh --green ;;
        *gray) "./scripts"/colors-light.sh --gray ;;
        *indigo) "./scripts"/colors-light.sh --indigo ;;
        *blue-light) "./scripts"/colors-light.sh --light-blue ;;
        *green-light) "./scripts"/colors-light.sh --light-green ;;
        *lime) "./scripts"/colors-light.sh --lime ;;
        *orange) "./scripts"/colors-light.sh --orange ;;
        *pink) "./scripts"/colors-light.sh --pink ;;
        *purple) "./scripts"/colors-light.sh --purple ;;
        *red) "./scripts"/colors-light.sh --red ;;
        *teal) "./scripts"/colors-light.sh --teal ;;
        *yellow) "./scripts"/colors-light.sh --yellow ;;
        ## Dark Colors
        *amber-dark) "./scripts"/colors-dark.sh --amber ;;
        *blue-dark) "./scripts"/colors-dark.sh --blue ;;
        *blue-gray-dark) "./scripts"/colors-dark.sh --blue-gray ;;
        *brown-dark) "./scripts"/colors-dark.sh --brown ;;
        *cyan-dark) "./scripts"/colors-dark.sh --cyan ;;
        *deep-orange-dark) "./scripts"/colors-dark.sh --deep-orange ;;
        *deep-purple-dark) "./scripts"/colors-dark.sh --deep-purple ;;
        *green-dark) "./scripts"/colors-dark.sh --green ;;
        *gray-dark) "./scripts"/colors-dark.sh --gray ;;
        *indigo-dark) "./scripts"/colors-dark.sh --indigo ;;
        *blue-light-dark) "./scripts"/colors-dark.sh --light-blue ;;
        *green-light-dark) "./scripts"/colors-dark.sh --light-green ;;
        *lime-dark) "./scripts"/colors-dark.sh --lime ;;
        *orange-dark) "./scripts"/colors-dark.sh --orange ;;
        *pink-dark) "./scripts"/colors-dark.sh --pink ;;
        *purple-dark) "./scripts"/colors-dark.sh --purple ;;
        *red-dark) "./scripts"/colors-dark.sh --red ;;
        *teal-dark) "./scripts"/colors-dark.sh --teal ;;
        *yellow-dark) "./scripts"/colors-dark.sh --yellow
    esac
