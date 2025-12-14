#!/bin/bash

# MATA qualquer seleção anterior travada (Correção do loop)
pkill slurp

# Define pastas
DIR="$HOME/Imagens"
NAME="captura_$(date +%Y%m%d_%H%M%S).png"
FILE="$DIR/$NAME"

if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

# Seleciona a área
GEOM=$(slurp)

# Se cancelar, sai
if [ -z "$GEOM" ]; then
    exit 0
fi

# Salva arquivo E copia pro Clipboard
grim -g "$GEOM" - | tee "$FILE" | wl-copy

# Notifica
notify-send "Screenshot Salvo" "Copiado para o Clipboard!" -i "$FILE"
