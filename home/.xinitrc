setxkbmap -layout lt -variant us -option 'grp:alt_caps_toggle, grp_led:scroll'
xmodmap ~/.xmodmap
xinput set-prop "ETPS/2 Elantech Touchpad" "Device Enabled" 0
xss-lock -- i3lock -c 000000 &

