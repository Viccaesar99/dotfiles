#!/bin/bash

# Cuenta las actualizaciones disponibles
if ! updates=$(checkupdates 2>/dev/null | wc -l); then
    updates=0
fi

# Devuelve el resultado en formato JSON para Waybar
if pgrep -x "pacman" > /dev/null; then
    echo "{\"text\": \"Actualizando...\", \"tooltip\": \"Descargando e instalando actualizaciones...\"}"
else

    echo "{\"text\": \"$updates\", \"tooltip\": \"$updates actualizaciones disponibles\"}"
fi
