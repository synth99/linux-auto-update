#!/bin/bash

# Auto Update Script for multiple Linux distros
# Run this as root or with sudo

# Detect package manager
if command -v apt >/dev/null; then
    echo "Detected Debian/Ubuntu-based system"
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

elif command -v dnf >/dev/null; then
    echo "Detected Fedora-based system"
    sudo dnf upgrade --refresh -y

elif command -v pacman >/dev/null; then
    echo "Detected Arch-based system"
    sudo pacman -Syu --noconfirm

elif command -v zypper >/dev/null; then
    echo "Detected openSUSE-based system"
    sudo zypper refresh && sudo zypper update -y

elif command -v emerge >/dev/null; then
    echo "Detected Gentoo-based system"
    sudo emerge --sync && sudo emerge -uDNav @world

else
    echo "⚠️ Unsupported distro or package manager not found."
    exit 1
fi

echo "✅ System update completed on $(date)"
