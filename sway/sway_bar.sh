# Change this according to your device
################
# Variables
################

# Date and time
date_and_week=$(date "+%d.%m.%Y/%-V")
current_time=$(date "+%H:%M")

#############
# Commands
#############

# Battery or charger
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}' | sed 's/%//')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

# Audio and multimedia
#audio_volume=$(pamixer --sink `pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-volume)
#audio_is_muted=$(pamixer --sink `pactl list sinks short | grep RUNNING | awk '{print $1}'` --get-mute)
audio_volume=$(amixer sget Master | grep Left: | awk -F"[][]" ' {print $2 }')
audio_is_muted=$(amixer sget Master | grep Left: | awk -F"[][]" ' {print $4 }')
media_song=$(playerctl metadata title)
player_status=$(playerctl status)

# Network
network=$(ip route get 1.1.1.1 | grep -Po '(?<=dev\s)\w+' | cut -f1 -d ' ')
network_SSID=$(iwgetid -r)
# interface_easyname grabs the "old" interface name before systemd renamed it
interface_easyname=$(dmesg | grep $network | grep renamed | awk 'NF>1{print $NF}')
ping=$(ping -c 1 www.google.es | tail -1| awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)

if [ $battery_status = "discharging" ];
then
	if [ $battery_charge -gt 90 ];
	then
		battery_pluggedin=''
	elif [ $battery_charge -gt 60 ];
	then
		battery_pluggedin=''
	elif [ $battery_charge -gt 40 ];
	then
		battery_pluggedin=''
	elif [ $battery_charge -gt 15 ];
	then
		battery_pluggedin=''
	else
		battery_pluggedin=''
	fi
else
    battery_pluggedin=' '
fi



if ! [ $network ]
then
   network_active="⛔"
else
   network_active="⇆"
fi

if [ $audio_is_muted = "off" ]
then
    audio_volume='muted '
fi

echo "♪ $audio_volume   |   $network_active $network_SSID ($ping ms)   |   $battery_pluggedin $battery_charge%   |    $date_and_week   |    $current_time  "
