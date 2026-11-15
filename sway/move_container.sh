ws=$(swaymsg -t get_workspaces)
cur=$(echo "$ws" | jq '.[] | select(.focused).num')

case "$1" in
  right) target=$((cur + 1)) ;;
  left)  target=$((cur - 1)) ;;
  new)   target=$(echo "$ws" | jq '[.[].num] | max + 1') ;;
esac

[ "$target" -ge 1 ] && swaymsg "move container to workspace number $target ; workspace number $target"
