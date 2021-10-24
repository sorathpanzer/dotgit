#!/bin/sh

dwmblocks &
udiskie &
numlockx &
xrdb -load $HOME/.Xresources &
xrandr --output "eDP-1" --brightness 0.70 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 100% &
picom --config ~/.config/picom/picom.conf -b &
syncthing -no-browser &
hsetroot -cover $HOME/Imagens/Wallpapers/mars.jpg &
#sudo wg-quick up wg0 &
#hsetroot -cover $HOME/Imagens/Wallpapers/$(ls $HOME/Imagens/Wallpapers | shuf -n 1) &

if uname -n | grep -q 'void-live'; then
  pulseaudio --daemonize=no --exit-idle-time=-1
fi

#--------SpeedUp keyboard
xset r rate 190 40 &
#--------Don't let computer sleep
xset s 0 0 &
xset s off &
