#!/bin/zsh

lid_status=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
if [ "$lid_status" == "closed" ]; then
    xrandr --output eDP-1 --off
    xrandr --output DP-1-2 --auto --primary --rate 120 --mode "1920x1080"
else
    xrandr --output eDP-1 --auto
    xrandr --output DP-1-2 --auto --primary --above eDP-1 --rate 120 --mode "1920x1080"
fi
