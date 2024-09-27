#!/bin/bash

# Function to check for sudo permissions
check_sudo() {
    if ! sudo -v; then
        echo "This script requires sudo privileges. Please run as a user with sudo access."
        exit 1
    fi
}

# Function to install LXC on Debian/Ubuntu
install_lxc_debian() {
    echo "Detected Debian/Ubuntu OS."
    sudo apt update
    sudo apt install -y lxc lxc-templates
}

# Function to install LXC on RedHat/CentOS
install_lxc_redhat() {
    echo "Detected RedHat/CentOS OS."
    sudo yum install -y epel-release
    sudo yum install -y lxc lxc-templates
}

# Function to install LXC on FreeBSD
install_lxc_freebsd() {
    echo "Detected FreeBSD OS."
    sudo pkg install -y lxc
}

# Function to check if Snap is installed
check_snap() {
    if ! command -v snap &> /dev/null; then
        echo "Snap is not installed. Installing Snap..."
        sudo apt install -y snapd
    fi
}

# Function to install LXD via Snap
install_lxd_snap() {
    check_snap
    echo "Installing LXD via Snap..."
    sudo snap install lxd
}

# Check the operating system
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"' | tr '[:upper:]' '[:lower:]')
case $OS in
    *debian* | *ubuntu*)
        check_sudo
        install_lxc_debian
        # Check if LXD is installed
        if ! command -v lxd &> /dev/null; then
            echo "LXD not found. Attempting to install..."
            sudo add-apt-repository universe
            sudo apt update
            sudo apt install -y lxd
        fi
        ;;
    *redhat* | *centos*)
        check_sudo
        install_lxc_redhat
        ;;
    *freebsd*)
        check_sudo
        install_lxc_freebsd
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac

# Display LXC version and network configuration
lxc-start --version
ip a | grep lxcbr0

# Initialize LXD
if command -v lxd &> /dev/null; then
    echo "Initializing LXD..."
    sudo lxd init
else
    echo "LXD was not found. Installing LXD via Snap..."
    install_lxd_snap
    # Initialize LXD after installation
    sudo lxd init
fi

# Verify LXD installation
lxd --version
