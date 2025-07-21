#!/bin/bash

# Define options
options=" Lock\n⏾ Suspend\n⏻ Poweroff\n Reboot\n Logout"

# Show menu
choice=$(echo -e "$options" | fuzzel --dmenu --prompt "Goodbye!")

# Act on choice
case "$choice" in
    *Lock) swaylock ;;
    *Suspend) systemctl suspend ;;
    *Poweroff) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Logout) swaymsg exit ;;
esac
