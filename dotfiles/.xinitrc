#!/bin/sh

dunst &
udiskie &
dwmblocks &
sudo wg-quick up wg0 &
xrdb -load $HOME/.Xresources &
xrandr --output "eDP-1" --brightness 0.80 &
xmodmap -e "keycode  21 = EuroSign" &
#/usr/bin/emacs --daemon &
sudo setleds -D +num < /dev/tty1 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 100% &
picom --config ~/.config/picom/picom.conf -b &
syncthing -no-browser &
xset dpms 0 0 0 && xset -dpms  && xset s off && xset s noblank &
feh --bg-fill $HOME/Imagens/Wallpapers/blackpurple.png &
exec dwm
