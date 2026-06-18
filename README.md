# workstation-iac

Infrastructure-as-Code for my personal development workstations. Reproducible setup
scripts, dotfiles, and configuration for two environments: a traditional Ubuntu/Xubuntu
desktop and an immutable Fedora Silverblue laptop.

The goal is a documented, version-controlled record of how each machine is built — so a
fresh install plus these scripts recreates a full cloud/DevOps environment.

## Structure

```
workstation-iac/
├── ubuntu-iac/        # Xubuntu desktop — dotfiles, DevOps toolchain, setup scripts
└── silverblue-iac/    # Fedora Silverblue laptop — immutable-system configuration
```

## silverblue-iac

Configuration for Fedora Silverblue (immutable OS), organized around its three layers:

- **rpm-ostree** — minimal host layer (system packages, fonts, drivers)
- **Flatpak** — GUI applications, installed from a versioned list
- **Toolbox** — containerized DevOps toolchain (Terraform, kubectl, Ansible, Vault, k9s)

Each layer has its own idempotent script and a plain-text config file, keeping data
separate from code. Includes a CKA (Certified Kubernetes Administrator) preparation
section with a local cluster definition and study notes.

## ubuntu-iac

Setup for the Xubuntu workstation — shell configuration, dotfiles, and the cloud
engineering toolchain (Docker, Terraform, Ansible, cloud CLIs).

## Tooling

Kubernetes · Terraform · Ansible · Docker / Podman · AWS · Azure · GCP · DigitalOcean
· Bash · Fedora Silverblue · Toolbox / Distrobox

## Notes

- Scripts are idempotent — safe to run repeatedly.
- Configuration lists (Flatpaks, packages) are kept separate from logic.
- Built incrementally as a hands-on learning project; documents the *why*, not just the *what*.
