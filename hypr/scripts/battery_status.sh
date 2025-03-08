#! /bin/bash

acpi_output=$(acpi -b)

b_status=$(echo "$acpi_output" | awk '{print $3}' | tr -d ',')

b_percentage=$(echo "$acpi_output" | awk '{print $4}' | tr -d '%,')

d_sound="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"
c_sound="/usr/share/sounds/freedesktop/stereo/dialog-information.oga"
plug_sound="/usr/share/sounds/freedesktop/stereo/power-plug.oga"
unplug_sound="/usr/share/sounds/freedesktop/stereo/power-unplug.oga"

full=0

if [[ "$b_status" == "Discharging" && "$b_percentage" -le 20 ]];
then
    notify-send -u critical "Bateria" "Conecte el dispositivo\nRestante: $b_percentage%"
    paplay "$d_sound" 2> /dev/null
fi

if [[ "$b_status" == "Charging" && "$b_percentage" -eq 100 && "$full" -eq 0]];
then
    notify-send -u normal "Bateria" "Completamente cargado"
    paplay "$c_sound" 2> /dev/null
    full=1
fi

if [[ "$b_status" == "Discharging" && "$b_percentage" -le 99 && "$full" -eq 1 ]];
then
    full=0
fi









