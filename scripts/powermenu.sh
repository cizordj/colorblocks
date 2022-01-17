#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$(dirname $0)/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown="  Desligar"
reboot="  Reiniciar"
lock="  Bloquear"
suspend="  Dormir"
logout="  Sair"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Você tem certeza? : "\
		-theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "Opções disponíveis -  sim / s / nao / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "sim" || $ans == "SIM" || $ans == "s" || $ans == "S" ]]; then
            loginctl -i poweroff
		elif [[ $ans == "nao" || $ans == "NAO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "sim" || $ans == "SIM" || $ans == "s" || $ans == "S" ]]; then
            loginctl -i reboot
		elif [[ $ans == "nao" || $ans == "NAO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $lock)
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
    $suspend)
		ans=$(confirm_exit &)
		if [[ $ans == "sim" || $ans == "SIM" || $ans == "s" || $ans == "S" ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $ans == "nao" || $ans == "NAO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $logout)
		ans=$(confirm_exit &)
		if [[ $ans == "sim" || $ans == "SIM" || $ans == "s" || $ans == "S" ]]; then
			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
				i3-msg exit
			fi
		elif [[ $ans == "nao" || $ans == "NAO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
esac
