#!/bin/bash

SELECTION="$(printf "Lock\nSuspend\nLog out\nReboot\nShutdown" | fuzzel --dmenu -l 7 -p "Power Menu: ")"

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		systemctl suspend;;
	*"Log out")
		swaymsg exit;;
	*"Reboot")
		systemctl reboot;;
	*"Reboot to UEFI")
		systemctl reboot --firmware-setup;;
	*"Hard reboot")
		pkexec "echo b > /proc/sysrq-trigger";;
	*"Shutdown")
		systemctl poweroff;;
esac
