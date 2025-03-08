#!/bin/bash

chosen=$(echo -e " Apagar\n Reiniciar\n Cerrar sesión" | rofi -dmenu -i -p "Menu")

case "$chosen" in
    " Apagar") systemctl poweroff ;;
    " Reiniciar") systemctl reboot ;;
    " Cerrar sesión") hyprctl dispatch exit ;;
esac

