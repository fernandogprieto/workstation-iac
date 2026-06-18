#!/usr/bin/env bash

# 02- flatpaks.sh  - Install my GUI apps from Flathub

echo "Setting up Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Flathub ready"

# Read the app list and install each one

LIST="config/flatpaks.txt"

while IFS= read -r app; do
	[[ -z "$app" || "$app" == \#* ]] && continue
	echo "Installing: $app"
    	flatpak install -y flathub "$app"
done < "$LIST"

echo "All apps processed."
