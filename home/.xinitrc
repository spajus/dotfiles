setxkbmap -layout lt -variant us -option 'ctrl:nocaps, grp:alt_caps_toggle, grp_led:scroll'
xss-lock -- i3lock -c 101010 &
pgrep -f /usr/bin/i3 || exec /usr/bin/i3
