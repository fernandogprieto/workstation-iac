#!/usr/bin/env bash

# 02- flatpaks.sh  - Install my GUI apps from Flathub

echo "Setting up Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo "Flathub ready"


