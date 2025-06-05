#!/bin/sh

search_term="$1"

# Aggregate the relevant bin directories
bin_paths="$HOME/.nix-profile/bin/ /etc/profiles/per-user/$USER/bin/ /run/current-system/sw/bin/"

# Search for executables across all of them
list=$(find $bin_paths -maxdepth 1 -executable ! -name ".*" ! -type d -printf "%f\n" 2>/dev/null | grep -m 10 -i "$search_term")

buf=""
for l in $list; do
	buf="$buf (button :class \"item\" :onclick \"eww close searchapps; $l &\" \"$l\")"
done

echo "(box :orientation \"v\" :spacing 5 :class \"apps\" :halign \"center\" :valign \"center\" $buf)" >~/.config/eww/scripts/search_items.txt
eww update search_listen="$(cat ~/.config/eww/scripts/search_items.txt)"
