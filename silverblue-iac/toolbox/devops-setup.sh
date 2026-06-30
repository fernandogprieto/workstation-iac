#!/usr/bin/env bash
#
# devops-setup.sh - runs INSIDE  the devops toolbox
# Installs the DevOps toolchain.

set -uo pipefail

echo "==> Installing base CLI tools..."
sudo dnf install -y htop btop git jq tmux python3 golang ansible snsible-lint hellcheck bat fzf ripgrep xdg-utils vim curl gnome-keyring libsecret

echo "==> Installing HashiCorp tools (terraform, vault)..."
sudo dnf install -y dnf-plugins-core
if [ ! -f /etc/yum.repos.d/hashicorp.repo ]; then
    sudo dnf config-manager addrepo --from-repofile=https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
fi
sudo dnf install -y terraform vault

echo "==> Installing kubectl..."
sudo dnf install -y kubernetes-client

echo "==> Installing VS Code..."
if ! command -v code &>/dev/null; then
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf install -y code
    echo "  installed VS Code"
else
    echo "  VS Code already present"
fi

echo "==> DevOps ToolBox setup complete"
