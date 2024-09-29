#!/bin/bash

# Update package list and install Git based on the distribution
if [ -f /etc/debian_version ]; then
    sudo apt update
    sudo apt install git -y
elif [ -f /etc/redhat-release ]; then
    sudo yum install git -y
elif [ -f /etc/fedora-release ]; then
    sudo dnf install git -y
elif [ -f /etc/arch-release ]; then
    sudo pacman -S git --noconfirm
elif [ -f /etc/SuSE-release ]; then
    sudo zypper install git -y
else
    echo "Unsupported distribution"
    exit 1
fi

echo "Git installed successfully!"
