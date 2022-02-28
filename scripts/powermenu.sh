#!/bin/sh

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

./sdir.sh
dir="$SDIR/rofi"
uptime="$(uptime -p | sed -e 's/up //g')"

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown="  Desligar"
reboot="  Reiniciar"
lock="  Bloquear"
suspend="  Dormir"
logout="  Sair"
# Confirmation
confirm_choice() {
    ANSWER=$(rofi -dmenu\
        -i\
        -no-fixed-num-lines\
        -p "Você tem certeza? : "\
        -theme "$dir/confirm.rasi" | tr '[:upper:]' '[:lower:]')
    if [ "$ANSWER" = "sim" ] || [ "$ANSWER" = "s" ]; then
        return 0
    elif [ "$ANSWER" = "nao" ] || [ "$ANSWER" = "n" ]; then
        return 1
    else
        msg
        confirm_choice
    fi
}

# Message
msg() {
    rofi -theme "$dir/message.rasi" -e "Opções disponíveis - sim | s | nao |n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo "$options" | $rofi_command -p \
    "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    "$shutdown")
        confirm_choice && {
            loginctl -i poweroff
        }
        ;;
    "$reboot")
        confirm_choice && {
            loginctl -i reboot
        }
        ;;
    "$lock")
        if command -v i3lock-fancy; then
            i3lock-fancy -p
        elif command -v slock; then
            slock
        elif command -v betterlockscreen; then
            betterlockscreen -l
        elif command -v i3lock; then
            i3lock
        fi
        ;;
    "$suspend")
        confirm_choice && {
                    mpc -q pause
                    amixer set Master mute
                    systemctl suspend
                }
            ;;
        "$logout")
            confirm_choice && {
                if [ "$DESKTOP_SESSION" = "Openbox" ]; then
                    openbox --exit
                elif [ "$DESKTOP_SESSION" = "bspwm" ]; then
                    bspc quit
                elif [ "$DESKTOP_SESSION" = "i3" ]; then
                    i3-msg exit
                fi
            }
        ;;
esac
