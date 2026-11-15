date_formatted=$(date "+%X %d-%m-%Y")

battery_info=$(upower --show-info $(upower --enumerate | grep 'BAT') | grep -E "state|percentage" | awk '{print $2}')

volume=$(pactl list sinks | grep '^[[:space:]]Volume:')
volume_state=$(pactl list sinks | grep '^[[:space:]]Mute')
volume_emoji="🔈"

if [[ "$volume_state" == *"Mute: yes"* ]] 
then
	volume_emoji="🔇"
fi

volume_percent=$(echo "$volume" | grep -oP 'front-left:.*?/\s*\K\d+%')

echo $volume_percent $volume_emoji  $battery_info 🔋  $date_formatted
