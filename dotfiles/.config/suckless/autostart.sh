#!/bin/bash
export EDITOR="nvim"
picom &
#hsetroot -solid black &
hsetroot -full $HOME/Imagens/Wallpapers/vader.png
xinput set-prop 12 "271" 1 &
exec /usr/lib/kdeconnectd &
exec redshift &
numlockx &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 150% &
#lxpolkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#brave | xdotool key Super+b &

dte(){
  dte="$(date +"%A, %B %d | 🕒 %H:%M%p")"
  echo -e "$dte"
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
  total=$((a+b+c+idle))
  cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
  echo -e "💻 $cpu% cpu"
}

battery(){
  ENERGY=$(cat /sys/class/power_supply/BAT?/capacity)
  echo -e "🔋$ENERGY%"
}

updates(){
  PMUPDATES=$(checkupdates | wc -l)
  echo -e "ᗧ $PMUPDATES"
}

temp(){
 TEMPERATURE=$(sensors | awk '/Core 0/ {print $3}')
 echo -e "🔥$TEMPERATURE"
}

while true; do
     xsetroot -name "$(updates) | $(cpu) | $(mem) | $(temp) | $(battery) | $(dte)"
     sleep 60s    # Update time every ten seconds
done &

wm_name="$1"
tf="${HOME}/.wm-unmapped-${wm_name}"

[[ ! -e $tf ]] && {
        xdotool search $wm_name windowunmap
        touch $tf
        exit 0
}

xdotool search $wm_name windowmap
xdotool search $wm_name windowraise
xdotool search $wm_name windowsize 100% 100%  windowmove 0 0
rm $tf
