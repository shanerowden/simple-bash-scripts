#!/bin/bash

# Resets hardware address on net adapters.
# Primarily used for initiating wireless monitor mode.
# on public wifi.

# USAGE:
# init_iface.sh [iface] <option>

# ARGS:
# $1 - a network interface
# $2 - blank or use 'monitor'

[[ ! $1 == '' ]] && IFACE="$1" || exit 1
MONITOR="$2"

echo "$IFACE"
sudo macchanger -s "$IFACE"
read -rp "Enter to randomize MAC / CTRL+C to Exit" inp

echo "Putting $IFACE down to configure. Be patient..."
sudo ip link set dev $IFACE down; sleep 2
sudo macchanger -b -a --random "$IFACE"; sleep 2
sudo ip link set dev "$IFACE" up; sleep 5

if [ "$MONITOR" == 'monitor' ]; then
    echo "Setting $IFACE to monitor mode..."
    sudo ip link set dev $IFACE down; sleep 2
    sudo iw "$IFACE" set monitor control; sleep 2
    sudo ip link set dev "$IFACE" up
fi

echo "All done."

# Comments:
# Might not be necessary to go up and down twice
# for mac change and monitor mode set. Also might
# not need the sleep calls. But it's the way I got
# it to take.
