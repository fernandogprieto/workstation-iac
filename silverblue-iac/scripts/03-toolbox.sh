#!/usr/bin/env bash
#
# 03-toolbox.sh - runs ON THE HOST
# Creates the 'devops' toolbox and provisions it with the setup script.

set -uo pipefail

TOOLBOX_NAME="devops"
SETUP_SCRIPT="toolbox/devops-setup.sh"

# Create the toolbox only if it doesn't already exist (idempotent)
if toolbox list | grep -q "$TOOLBOX_NAME"; then
    echo "Toolbox '$TOOLBOX_NAME' already exists."
else
    echo "Creating toolbox '$TOOLBOX_NAME'..."
    toolbox create -y "$TOOLBOX_NAME"
fi

# Run the setup script INSIDE the toolbox
echo "Provisioning '$TOOLBOX_NAME'..."
toolbox run --container "$TOOLBOX_NAME" bash "$SETUP_SCRIPT"

echo "Done! Enter with: toolbox enter $TOOLBOX_NAME"
