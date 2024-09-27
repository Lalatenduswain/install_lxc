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

# Check the operating system
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"' | tr '[:upper:]' '[:lower:]')
case $OS in
    *debian* | *ubuntu*)
        check_sudo
        install_lxc_debian
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
sudo lxd init
