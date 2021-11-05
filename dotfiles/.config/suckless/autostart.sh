#!/bin/sh

dunst &
dwmblocks &
#$HOME/.config/polybar/launch.sh &
udiskie &
numlockx &
xrdb -load $HOME/.Xresources &
xrandr --output "eDP-1" --brightness 0.70 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 100% &
picom --config ~/.config/picom/picom.conf -b &
syncthing -no-browser &
xset dpms 0 0 0 && xset -dpms  && xset s off && xset s noblank &
hsetroot -cover $HOME/Imagens/Wallpapers/blackplanet.jpg &
#sudo wg-quick up wg0 &
#hsetroot -cover $HOME/Imagens/Wallpapers/$(ls $HOME/Imagens/Wallpapers | shuf -n 1) &

if uname -n | grep -q 'void-live'; then
  pulseaudio --daemonize=no --exit-idle-time=-1
fi
