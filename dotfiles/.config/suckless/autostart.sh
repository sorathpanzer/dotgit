#!/bin/bash

picom &
udiskie &
numlockx &
exec /usr/lib/kdeconnectd &
hsetroot -full $HOME/Imagens/Wallpapers/vader.png &
xrandr --output "eDP-1" --brightness 0.70 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 150% &
#lxpolkit &
#exec redshift &
#hsetroot -solid black &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

clock(){
  clock="$(date +"%a, %B %d %l:%M%p"| sed 's/  / /g')"
  echo -e "🕒 $clock"
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "⚛ $mem"
picom &
}

cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$( (a+b+c+idle) )
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "💻 $cpu% cpu"
}

battery(){
  ENERGY=$(cat /sys/class/power_supply/BAT?/capacity)
  echo -e "⚡ $ENERGY%"
}

updates(){
  PMUPDATES=$(checkupdates | wc -l)
  echo -e "📦 $PMUPDATES"
}

temp(){
 TEMPERATURE=$(sensors | awk '/Core 0/ {print $3}')
 echo -e "🔥$TEMPERATURE"
}

news(){
  NEWS=$(newsboat -x print-unread | awk '{ print $1}')
  echo -e "📰 $NEWS"
}

disk(){
 DISK=$(df -h / | awk ' /[0-9]/ {print $3 "/" $2}')
 echo -e "💾 $DISK"
}

while true; do
  xsetroot -name "$(news) | $(updates) | $(cpu) | $(mem) | $(temp) | $(disk) | $(battery) | $(clock)"
     sleep 60s    # Update time every ten seconds
done &

