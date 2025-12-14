#!/bin/bash

# Pasta onde estão seus wallpapers (Pode colocar os do Hyprland aqui também)
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Se quiser incluir os padrões do Hyprland na rotação, descomente a linha abaixo:
# WALLPAPER_DIR="/usr/share/hypr/"

# Seleciona uma imagem aleatória da pasta (.png, .jpg, .jpeg)
RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n 1)

# Aplica o wallpaper com transição (SWWW)
# Se usar Hyprpaper, o comando seria: hyprctl hyprpaper wallpaper ",$RANDOM_WALL"
swww img "$RANDOM_WALL" --transition-type grow --transition-pos 0.854,0.977 --transition-step 90 --transition-fps 60
