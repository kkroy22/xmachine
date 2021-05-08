xprop -id $ID
xprop -name $name
pkill -USR1 -x compton
bspc query -N -n .window
