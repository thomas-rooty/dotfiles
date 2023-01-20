#!/bin/zsh

lid_status=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
if [ "$lid_status" == "closed" ]; then
    xrandr --output eDP-1 --off
    xrandr --output DP-1-1 --auto --primary --left-of DP-1-3
    xrandr --output DP-1-3 --auto --rate 59.95 --right-of DP-1-1
else
    xrandr --output eDP-1 --auto --left-of DP-1-1
    xrandr --output DP-1-1 --auto --primary --mode "1920x1080" --left-of DP-1-3
    xrandr --output DP-1-3 --auto --rate 59.95 --right-of DP-1-1
fi
