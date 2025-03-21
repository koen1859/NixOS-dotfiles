#!/bin/bash

WALLPAPER_DIR="$HOME/.dotfiles/Wallpapers/"

# Get all image files sorted alphabetically
WALLPAPERS=($(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort))

# Get the current wallpaper (from swww query)
CURRENT_WALLPAPER=$(swww query | grep "currently displaying" | awk -F 'image: ' '{print $2}' | tr -d ' ')

# Find the index of the current wallpaper in the list
CURRENT_INDEX=-1
for i in "${!WALLPAPERS[@]}"; do
    if [[ "${WALLPAPERS[i]}" == "$CURRENT_WALLPAPER" ]]; then
        CURRENT_INDEX=$i
        break
    fi
done

# If the current wallpaper is found, set the next one; otherwise, set the first one
if [[ $CURRENT_INDEX -ge 0 && $CURRENT_INDEX -lt $((${#WALLPAPERS[@]} - 1)) ]]; then
    NEXT_INDEX=$((CURRENT_INDEX + 1))
else
    NEXT_INDEX=0
fi

# Set the next wallpaper
NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"
swww img "$NEXT_WALLPAPER" --transition-type=wipe
wal -i "$NEXT_WALLPAPER"
