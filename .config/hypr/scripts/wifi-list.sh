#!/bin/bash

networks=$(nmcli -t -f SSID device wifi list)

selected_network=$(echo "$networks" | rofi -dmenu -p "Selecciona una red")

if [ -n "selected_network" ]; then
    nmcli device wifi connect "$selected_network"
else
    echo "No se ha seleccionado ninguna red"
fi
