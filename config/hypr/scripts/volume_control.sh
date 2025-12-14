#!/bin/bash

# Define o passo do volume (5%)
STEP="5%"

# Função para enviar a notificação
send_notification() {
    # Pega o volume atual
    VOL=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
    
    # Verifica se está mutado
    IS_MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "MUTED")

    if [ -n "$IS_MUTED" ]; then
        # Ícone de mudo corrigido
        notify-send "Muted" -i audio-volume-muted-symbolic -h string:x-dunst-stack-tag:volume -u low
    else
        # Escolhe o ícone baseado no volume (versões simbólicas)
        if [ "$VOL" -ge 70 ]; then
            ICON="audio-volume-high-symbolic"
        elif [ "$VOL" -ge 30 ]; then
            ICON="audio-volume-medium-symbolic"
        else
            ICON="audio-volume-low-symbolic"
        fi

        # Manda a notificação
        notify-send "Volume: ${VOL}%" -i "$ICON" -h int:value:"$VOL" -h string:x-dunst-stack-tag:volume
    fi
}

# Lógica dos argumentos
case $1 in
    up)
        wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
        send_notification
        ;;
    down)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        send_notification
        ;;
    mute)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        send_notification
        ;;
esac
