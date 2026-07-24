#!/bin/bash

# ---- Громкость ----
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o 'MUTED')

if [ -n "$muted" ]; then
    vol_text="󰖁"      # иконка перечёркнутого динамика
else
    vol_text="${vol%.*}%"
fi

# ---- Раскладка ----
layout=$(xkb-switch -p 2>/dev/null)
if [ "$layout" = "us" ]; then
    layout_text="US"
elif [ "$layout" = "ru" ]; then
    layout_text="RU"
else
    layout_text="$layout"
fi

# ---- Вывод (разделитель – пробел) ----
echo "$vol_text  $layout_text"