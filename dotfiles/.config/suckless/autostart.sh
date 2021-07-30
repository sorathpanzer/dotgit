#!/bin/sh

slstatus &
udiskie &
numlockx &
xrdb -load $HOME/.Xresources &
xrandr --output "eDP-1" --brightness 0.70 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 100% &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --config ~/.config/picom/picom.conf -b &
hsetroot -solid "#000000" &
syncthing -no-browser &
#hsetroot -cover $HOME/Imagens/Waterfall.jpg &
