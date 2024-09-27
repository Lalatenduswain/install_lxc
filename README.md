# install_lxc

This script automates the installation of LXC (Linux Containers) based on the detected operating system. It checks for the OS type, verifies sudo permissions, and installs the necessary packages to set up LXC on your system.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Disclaimer](#disclaimer-running-the-script)
- [Donations](#donations)
- [Support or Contact](#support-or-contact)

## Prerequisites

Before running the script, ensure you have the following:

1. **Operating System**: The script supports:
   - Debian/Ubuntu
   - RedHat/CentOS
   - FreeBSD

2. **Sudo Access**: You need to have sudo privileges on your system to install packages.

3. **Required Packages**:
   - For Debian/Ubuntu: `apt`
   - For RedHat/CentOS: `yum`
   - For FreeBSD: `pkg`

Make sure your package manager is up-to-date. If you're using Debian/Ubuntu, run:
```bash
sudo apt update
```

If you're using RedHat/CentOS, run:
```bash
sudo yum update
```

## Installation

To install the script, follow these steps:

1. **Clone the Repository**:
   Open your terminal and run the following command:
   ```bash
   git clone https://github.com/Lalatenduswain/install_lxc
   ```

2. **Navigate to the Directory**:
   Change to the directory containing the script:
   ```bash
   cd install_lxc
   ```

3. **Make the Script Executable**:
   Change the permissions to make the script executable:
   ```bash
   chmod +x install_lxc.sh
   ```

## Usage

To run the script, execute the following command in your terminal:
```bash
./install_lxc.sh
```

The script will:
- Detect your operating system.
- Check for sudo permissions.
- Install LXC and LXC templates as necessary.
- Display the LXC version and network configuration.
- Initialize LXD for container management.

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations

If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

## Support or Contact

Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/install_lxc/issues).
