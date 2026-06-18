#!/usr/bin/env bash
#
# 01-rpm-ostree.sh - layer system packages onto the base image
# Reads config/rpm-ostree.txt and installs only what's not already layered.

set -uo pipefail

LIST="config/rpm-ostree.txt"

# collect packages that aren't installed yet
TO_INSTALL=()

while IFS= read -r pkg; do
	# skip empty lines and comments
	[[ -z "$pkg" || "$pkg" == \#* ]] && continue

	# check if alredy layered
	if rpm-ostree status | grep -q "$pkg"; then
		echo "Alredy layered: $pkg"
	else
		echo "Will install: $pkg"
		TO_INSTALL+=("$pkg")
	fi
done < "$LIST"

# install all pending packages in ONE command
if [ ${#TO_INSTALL[@]} -eq 0 ]; then
	echo "Nothing new to layer."
else
	echo "Installing: ${TO_INSTALL[*]}"
	rpm-ostree install "${TO_INSTALL[@]}"
	echo "Done, Reboot to apply: systemctl reboot"
fi
