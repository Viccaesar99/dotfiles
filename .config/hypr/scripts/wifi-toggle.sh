#!/bin/bash

estado=$(nmcli radio wifi)

if [ "$estado" = "enabled" ]; then
    nmcli radio wifi off
    notify-send "WiFi Desactivado" "Se ha desactivado el WiFi"
else
    nmcli radio wifi on
    notify-send "WiFi Activado" "Se ha activado el WiFi"
fi

