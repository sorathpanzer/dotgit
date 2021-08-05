#!/bin/sh

slstatus &
udiskie &
numlockx &
xrdb -load $HOME/.Xresources &
xrandr --output "eDP-1" --brightness 0.70 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 100% &
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom --config ~/.config/picom/picom.conf -b &
syncthing -no-browser &
hsetroot -cover $HOME/Imagens/Wallpapers/clouds.png &
#hsetroot -solid "#000000" &

if uname -n | grep -q 'void-live'; then
  pulseaudio --daemonize=no --exit-idle-time=-1
fi

