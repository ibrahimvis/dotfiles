#!/bin/sh
#xrandr --output DP-1 --off --output HDMI-1 --primary --mode 2560x1080 --pos 0x0 --rotate normal --output eDP-1 --off --output HDMI-2 --off

sleep .1
if xrandr | grep 'DisplayPort-0' | grep ' connected' &>/dev/null; then
  echo 'DisplayPort-0 connected, restoring layout'
  xrandr --output DisplayPort-0 --primary --rate 144 --mode 3440x1440 --auto --output DisplayPort-1 --rate 60 --mode 1920x1080 --right-of DisplayPort-0
  echo 'Calling feh for desktop wallpaper'
  echo 'Running polybar'
  polybar top &
  echo 'Done'
fi

# Welcome back notification/startup sound
echo 'Sending notification'
notify-send "Bentornato $(whoami)"
