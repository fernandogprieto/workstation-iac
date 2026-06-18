#!/usr/bin/env bash
#
# cka-setup.sh - runs INSIDE a toolbox
# Installs tools for CKA practice (local cluster + kubectl helpers).

set -uo pipefail

echo "==> kubectl..."
sudo dnf install -y kubernetes-client

echo "==> kind (local Kubernetes cluster)..."
if ! command -v kind &>/dev/null; then
    curl -sLo /tmp/kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
    sudo install /tmp/kind /usr/local/bin/kind
    echo "  installed kind"
else
    echo "  kind already present"
fi

echo "==> k9s (cluster TUI)..."
if ! command -v k9s &>/dev/null; then
    K9S_VER=$(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | jq -r .tag_name)
    curl -sL "https://github.com/derailed/k9s/releases/download/${K9S_VER}/k9s_Linux_amd64.tar.gz" \
        | sudo tar xz -C /usr/local/bin k9s
    echo "  installed k9s ${K9S_VER}"
else
    echo "  k9s already present"
fi

echo "==> CKA tools ready! Create a cluster: kind create cluster --config config/kind-cluster.yaml"
