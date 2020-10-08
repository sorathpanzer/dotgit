#!/bin/bash

#picom &
udiskie &
numlockx &
hsetroot -solid black
xrdb -load $HOME/.Xresources &
xrandr --output "eDP-1" --brightness 0.70 &
xinput --set-prop "SYNA2B46:00 06CB:CD5F Touchpad" "libinput Natural Scrolling Enabled" 1 &
pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo 150% &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

clock() {
  clock=$(date '+%I')

case "$clock" in
	"00") icon="🕛" ;;
	"01") icon="🕐" ;;
	"02") icon="🕑" ;;
	"03") icon="🕒" ;;
	"04") icon="🕓" ;;
	"05") icon="🕔" ;;
	"06") icon="🕕" ;;
	"07") icon="🕖" ;;
	"08") icon="🕗" ;;
	"09") icon="🕘" ;;
	"10") icon="🕙" ;;
	"11") icon="🕚" ;;
	"12") icon="🕛" ;;
esac

#date "+%Y %b %d (%a) $icon%I:%M%p"
date +"$icon %a, %B %d %l:%M%p"| sed 's/  / /g'
}

mem(){
  mem=`free | awk '/Mem/ {printf "%d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
  echo -e "💻 $mem"
picom &
}

battery(){
# Loop through all attached batteries.
for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity) || break
	status=$(sed "s/[Dd]ischarging/🔋/;s/[Nn]ot charging/🛑/;s/[Cc]harging/🔌/;s/[Uu]nknown/♻️/;s/[Ff]ull/⚡/" "$battery"/status)

	# If it is discharging and 25% or less, we will add a ❗ as a warning.
	 [ "$capacity" -le 25 ] && [ "$status" = "🔋" ] && warn="❗"

	printf "%s%s%s%% " "$status" "$warn" "$capacity"
	unset warn
done | sed 's/ *$//'

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

torrent(){
  transmission-remote -l | grep % |
	sed " # This first sed command is to ensure a desirable order with sort
	s/.*Stopped.*/A/g;
	s/.*Seeding.*/Z/g;
	s/.*100%.*/N/g;
	s/.*Idle.*/B/g;
	s/.*Uploading.*/L/g;
	s/.*%.*/M/g" |
		sort -h | uniq -c | sed " # Now we replace the standin letters with icons.
				s/A/🛑/g;
				s/B/🕰/g;
				s/L/🔼/g;
				s/M/🔽/g;
				s/N/✅/g;
				s/Z/🌱/g" | awk '{print $2 $1}' | paste -sd ' '
}

while true; do
  xsetroot -name "$(torrent) < $(news) | $(updates) | $(mem) | $(temp) | $(disk) | $(battery) | $(clock)"
     sleep 60s    # Update time every ten seconds
done &
