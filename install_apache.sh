#!/bin/bash

# Function to install Apache based on the package manager
install_apache() {
    if [ -f /etc/debian_version ]; then
        # For Debian/Ubuntu based systems
        echo "Detected Debian/Ubuntu. Installing Apache..."
        sudo apt update
        sudo apt install -y apache2
    elif [ -f /etc/redhat-release ]; then
        # For Red Hat/CentOS/Fedora based systems
        echo "Detected Red Hat/CentOS/Fedora. Installing Apache..."
        sudo dnf install -y httpd  # Use 'yum' for older versions
    elif [ -f /etc/arch-release ]; then
        # For Arch Linux
        echo "Detected Arch Linux. Installing Apache..."
        sudo pacman -Syu --noconfirm apache
    else
        echo "Unsupported Linux distribution."
        exit 1
    fi

    # Start and enable Apache service
    echo "Starting Apache service..."
    sudo systemctl start apache2 || sudo systemctl start httpd
    sudo systemctl enable apache2 || sudo systemctl enable httpd

    echo "Apache installed and started successfully!"
}

# Execute the install function
install_apache
